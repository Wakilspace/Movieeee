import 'package:flutter/material.dart';
import 'package:movie_app1/modules/movies.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:movie_app1/provider/pro_stack.dart';
import 'package:provider/provider.dart';
import 'package:movie_app1/shared.dart';


class MovieScreen extends StatelessWidget {
  final Movie movie;
  const MovieScreen({Key? key, required this.movie}) : super(key: key);
  




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ..._buildBackground(context, movie),
          _buildMovieInformation(context),
          _buildActions(context)
        ],
      ),
    );
  }

  Positioned _buildActions(BuildContext context) {
    return Positioned(
      bottom: 50,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<ProviderVM>(
              builder: (BuildContext context, ProviderVM value, Widget? child)=> InkWell(
                onTap: () async {
                  await UserSimplePreferences().setMoviename(movie.name);
                  value.add(movie.name, movie.imagePath, movie.videoPath, movie.category, movie.year, movie.duration);
                },
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  height: 50,
                  width: 150 ,
                  decoration:  BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      "Watchlist",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold
                        
                      ),
                    ),
                  ),
                  
                ),
                
              ) ,            
            ),
            const SizedBox(
              width: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15.0),
                backgroundColor: Colors.yellow,
                fixedSize: Size(MediaQuery.of(context).size.width * 0.425, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => _MoviePlayer(movie: movie),
                  ),
                );
              },
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Play',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    const TextSpan(
                      text: 'video',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Positioned _buildMovieInformation(BuildContext context) {
    return Positioned(
      bottom: 150,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              movie.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '${movie.year} | ${movie.category} | ${movie.duration.inHours}h ${movie.duration.inMinutes.remainder(60)}m,',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RatingBar.builder(
                initialRating: 3.5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                ignoreGestures: true,
                itemCount: 5,
                itemSize: 20,
                unratedColor: Colors.white,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, index) {
                  return const Icon(
                    Icons.star,
                    color: Colors.amber,
                  );
                },
                onRatingUpdate: (rating) {}),
            const SizedBox(
              height: 20,
            ),
            Text(
              'When a peaceful settlement on the edge of a distant moon finds itself threatened by the armies of a tyrannical ruling force, a mysterious stranger living among its villagers becomes their best hope for survival.',
              maxLines: 8,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(height: 1.75, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildBackground(context, movie) {
    return [
      Container(
        height: double.infinity,
        color: const Color.fromARGB(255, 8, 48, 82),
      ),
      Image.network(
        movie.imagePath,
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.5,
        fit: BoxFit.cover,
      ),
      const Positioned.fill(
        child: DecoratedBox(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.transparent,
              Color.fromARGB(255, 8, 48, 82),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.3, 0.5],
          )),
        ),
      ),
    ];
  }
}


class _MoviePlayer extends StatefulWidget {
  const _MoviePlayer({Key? key, required this.movie,}): super(key: key);

  final Movie movie;

  @override
  State<_MoviePlayer> createState() => __MoviePlayerState();
}

class __MoviePlayerState extends State<_MoviePlayer> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  @override
  void initState() {
    super.initState();

    videoPlayerController = VideoPlayerController.asset(widget.movie.videoPath)
    ..initialize()
    .then((value) {setState(() {});}
    );

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 16/9
      );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Chewie(
          controller: chewieController,),
        ),
    );
  }
}