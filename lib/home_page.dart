import 'package:flutter/material.dart';
import 'package:movie_app1/modules/movies.dart';
import 'package:movie_app1/screen/movie_screen.dart';
import 'package:movie_app1/widgets/movielist.dart';
import 'screen/wish_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    List<Movie> movies = Movie.movies;
    return  Scaffold( 
      backgroundColor: const Color.fromARGB(214, 17, 6, 5),
      appBar: const CustomAppBar(
          title: 'KilliApp',
          backgroundColor: Colors.black,
          textColor: Colors.white,
          height: 70,
          bottomLeftRadius: 35,
          bottomRightRadius: 35),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'FEATURED MOVIE',
              style: TextStyle(
              color: Colors.white

              ),),
            Expanded(
              child: ListView(
                children: [
                  for(final movie in movies)
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => MovieScreen(movie: movie)));
                    },
                    child: MovieListItem(
                      imageUrl: movie.imagePath, 
                      name: movie.name, 
                      information: '${movie.year} | ${movie.category} | ${movie.duration.inHours}h ${movie.duration.inMinutes.remainder(60)}m,'),
                  ),
                ],
              ),),
              const SizedBox(height: 20,),
              const Text('POPULAR MOVIES',
              style: TextStyle(
                color: Colors.white,
              ),),
              Expanded(
                child: SizedBox(
                  height: 400,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      for(final movie in movies)
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => MovieScreen(movie: movie)));
                      },
                      child: MovieListItem(
                        imageUrl: movie.imagePath, 
                        name: movie.name, 
                        information: '${movie.year} | ${movie.category} | ${movie.duration.inHours}h ${movie.duration.inMinutes.remainder(60)}m,'),
                    ),
                    ],
                  ),
                ),
              )
          
          ],
        ),),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final double height;
  final double bottomLeftRadius;
  final double bottomRightRadius;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.textColor,
    required this.height,
    required this.bottomLeftRadius,
    required this.bottomRightRadius,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(bottomLeftRadius),
        bottomRight: Radius.circular(bottomRightRadius),
      )),
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(color: textColor),
      ),
      backgroundColor: backgroundColor,
      toolbarHeight: height,
      actions: <Widget>[
        IconButton(
          onPressed: (){
            final route = MaterialPageRoute(builder: (context) => const WishList());
            Navigator.push(context, route);
          }, 
          icon: const Icon(Icons.add_box, color: Colors.white,))
      ],
    );
  }
}
