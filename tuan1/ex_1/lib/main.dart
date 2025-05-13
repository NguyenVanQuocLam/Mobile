import 'package:flutter/material.dart';

void main() => runApp(ProfileApp());

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Nút Back (góc trái)
            Positioned(
              left: width * 0.04,
              top: height * 0.02,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios_new),
                iconSize: width * 0.06,
                onPressed: () {},
              ),
            ),

            // Nút Edit (góc phải)
            Positioned(
              right: width * 0.04,
              top: height * 0.02,
              child: IconButton(
                icon: Icon(Icons.edit_outlined),
                iconSize: width * 0.06,
                onPressed: () {},
              ),
            ),

            // Nội dung chính
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: width * 0.2,
                    backgroundImage: NetworkImage(
                      'https://ocdn.eu/sport-images-transforms/1/uLkk9lBaHR0cHM6Ly9vY2RuLmV1L3B1bHNjbXMvTURBXy82NzQ2MmQ4NWRiMDYzNzNmZTM2OGYzYTU1YzNiNjkzOS5qcGeTlQMAM80EAM0CQJMFzQSwzQJ0kwmmZDQxZDhjBt4AAqEwAaExAQ',
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  Text(
                    'T1 Faker',
                    style: TextStyle(
                      fontSize: width * 0.06,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                    'Seoul, Hàn Quốc',
                    style: TextStyle(
                      fontSize: width * 0.045,
                      color: Colors.grey[700],
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
