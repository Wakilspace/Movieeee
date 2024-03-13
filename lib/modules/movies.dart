class Movie {
  final String name;
  final String imagePath;
  final String videoPath;
  final String category;
  final int year;
  final Duration duration;



  const Movie({
   required this.name,
   required this.imagePath,
   required this.videoPath,
   required this.category,
   required this.year,
   required this.duration,
  });



  static List <Movie> movies=[
    const Movie(
      name: 'REBEL MOON', 
      imagePath: 'https://static.tvtropes.org/pmwiki/pub/images/en_us_rm_teaser_kora_vertical_27x40_srgb_pre.jpg', 
      videoPath: 'assets/videos/Rebel Moon - Part Two_ The Scargiver _ Official Teaser _ Netflix.mp4', 
      category: 'Fantasy', 
      year: 2023, 
      duration: Duration(hours: 2, minutes:14 ), ),

      const Movie(
      name: 'REBEL MOON', 
      imagePath: 'https://static.tvtropes.org/pmwiki/pub/images/en_us_rm_teaser_kora_vertical_27x40_srgb_pre.jpg', 
      videoPath: 'assets/videos/Rebel Moon - Part Two_ The Scargiver _ Official Teaser _ Netflix.mp4', 
      category: 'Fantasy', 
      year: 2023, 
      duration: Duration(hours: 2, minutes:14 ), ),

      const Movie(
      name: 'REBEL MOON', 
      imagePath: 'https://static.tvtropes.org/pmwiki/pub/images/en_us_rm_teaser_kora_vertical_27x40_srgb_pre.jpg', 
      videoPath: 'assets/videos/Rebel Moon - Part Two_ The Scargiver _ Official Teaser _ Netflix.mp4', 
      category: 'Fantasy', 
      year: 2023, 
      duration: Duration(hours: 2, minutes:14 ), ),

      const Movie(
      name: 'REBEL MOON', 
      imagePath: 'https://static.tvtropes.org/pmwiki/pub/images/en_us_rm_teaser_kora_vertical_27x40_srgb_pre.jpg', 
      videoPath: 'assets/videos/Rebel Moon - Part Two_ The Scargiver _ Official Teaser _ Netflix.mp4', 
      category: 'Fantasy', 
      year: 2023, 
      duration: Duration(hours: 2, minutes:14 ), )
  ];

  get image => null;



  
}

