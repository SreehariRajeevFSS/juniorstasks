class Movie {
  final String title;
  final String year;
  final String posterUrl;

  Movie({required this.title, required this.year, required this.posterUrl});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['Title'],
      year: json['Year'],
      posterUrl: json['Poster'],
    );
  }
}
