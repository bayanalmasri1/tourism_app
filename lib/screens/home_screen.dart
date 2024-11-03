import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourism_app/screens/map_screen.dart';
import '../model/places.dart';
import 'details_screen.dart';
import '../widgets/destination_card.dart';
import '../widgets/icons.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tourism App'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search destinations, activities...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                quickAccessIcon(Icons.home, () {}),
                quickAccessIcon(Icons.restaurant, () {}),
                quickAccessIcon(Icons.local_activity, () {}),
                quickAccessIcon(Icons.map, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MapScreen(
                              latitude: 24.7136, // إحداثيات الرياض
                              longitude: 46.6753, // إحداثيات الرياض
                              locationName: 'الرياض', // اسم الموقع الافتراضي
                            )),
                  );
                }),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Popular Destinations',
                style: GoogleFonts.cairo(
                    fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 300,
              width: 400,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: destinations.length,
                itemBuilder: (context, index) {
                  final destination = destinations[index];
                  return DestinationCard(
                    name: destination['name'],
                    imageUrl: 'assets/images/${index + 1}.jpg',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DestinationDetailsScreen(
                              destination: destination),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
