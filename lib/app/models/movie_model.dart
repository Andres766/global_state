class Movie {
  final int id;
  final String title;
  final String category;
  final String description;
  final double rating;
  final String emoji;
  final int duration;
  final int year;
  final List<String> cast;
  bool isFavorite;

  Movie({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.rating,
    required this.emoji,
    required this.duration,
    required this.year,
    required this.cast,
    this.isFavorite = false,
  });
}

class Review {
  final String author;
  final String comment;
  final double rating;
  final String date;

  Review({
    required this.author,
    required this.comment,
    required this.rating,
    required this.date,
  });
}