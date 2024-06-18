import 'package:flutter/material.dart';

class CollegeCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String recommendation;
  final String price;
  final String description;
  final String additionalInfo;
  final double rating;
  final int reviews;
  final VoidCallback onTap;

  CollegeCard({
    required this.imagePath,
    required this.name,
    required this.recommendation,
    required this.price,
    required this.description,
    required this.additionalInfo,
    required this.rating,
    required this.reviews,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Icon(
                        Icons.broken_image,
                        size: 40,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text(description, style: TextStyle(fontSize: 14)),
                  SizedBox(height: 4),
                  Text(additionalInfo, style: TextStyle(fontSize: 12, color: Colors.grey)),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      SizedBox(width: 4),
                      Text('$rating ($reviews avaliações)', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(recommendation, style: TextStyle(fontSize: 12, color: Colors.green)),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: onTap,
                    child: Text('Saiba Mais'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                      minimumSize: Size(double.infinity, 36),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
