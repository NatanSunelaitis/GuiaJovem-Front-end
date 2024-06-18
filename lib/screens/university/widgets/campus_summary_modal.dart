import 'package:flutter/material.dart';

class CampusSummaryModal extends StatelessWidget {
  final String campusName;

  const CampusSummaryModal({Key? key, required this.campusName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: EdgeInsets.all(16.0),
        constraints: BoxConstraints(maxWidth: 600),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            Text(
              campusName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              'Lista de cursos oferecidos neste campus.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
            // Adicione aqui a lista de cursos
          ],
        ),
      ),
    );
  }
}
