import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'map_screen.dart'; // تأكد من استيراد MapScreen

class DestinationDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> destination;

  const DestinationDetailsScreen({required this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(destination['name']),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Country: ${destination['country']}',
              style: GoogleFonts.cairo(fontSize: 22),
            ),
            SizedBox(height: 10),
            Text(
              'Attractions:',
              style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: destination['attractions'].length,
                itemBuilder: (context, index) {
                  final attraction = destination['attractions'][index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (attraction['image'] != null)
                            Image.asset(
                              attraction['image'],
                              width: 200,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          SizedBox(height: 10),
                          Text(
                            attraction['name'],
                            style: GoogleFonts.cairo(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            attraction['description'],
                            style: GoogleFonts.cairo(fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MapScreen(
                        latitude: destination['latitude'],   // تمرير خط العرض
                        longitude: destination['longitude'], // تمرير خط الطول
                        locationName: destination['name'],   // اسم الموقع
                      ),
                    ),
                  );
                },
                child: Text('Show on Map'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
