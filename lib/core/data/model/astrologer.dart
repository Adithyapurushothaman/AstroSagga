class Astrologer {
  final String id;
  final String name;
  final String expertise;
  final String experience;
  final double rating;
  final int price;
  final int followers;
  final bool isOnline;
  final String about;
  final List<String> skills;
  final List<String> languages;

  Astrologer({
    required this.id,
    required this.name,
    required this.expertise,
    required this.experience,
    required this.rating,
    required this.price,
    required this.followers,
    this.isOnline = true,
    this.about = '',
    this.skills = const [],
    this.languages = const [],
  });
}
