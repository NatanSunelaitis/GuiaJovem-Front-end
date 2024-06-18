import 'package:guia_jovem/models/campus.dart';

class University {
  final String name;
  final String description;
  final String website;
  final double rating;
  final int reviewCount;
  final List<Campus> campuses;

  University({
    required this.name,
    required this.description,
    required this.website,
    required this.rating,
    required this.reviewCount,
    required this.campuses,
  });
}
