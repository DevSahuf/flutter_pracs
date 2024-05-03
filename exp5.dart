import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Row and Column with Image and Button"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Image.network(
                    'https://buffer.com/library/content/images/2023/10/free-images.jpg',
                    height: 100,
                  ),
                ),
                SizedBox(width: 16),  // Spacing between image and button
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Button in Row Pressed")),
                    );
                  },
                  child: Text("Row Button"),
                ),
              ],
            ),
            SizedBox(height: 16),  // Spacing between row and column
            Column(
              children: [
                Image.network('https://cdn.pixabay.com/photo/2016/05/05/02/37/sunset-1373171_1280.jpg', height: 100),  // Image from assets
                SizedBox(height: 16),  // Spacing between image and button
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Button in Column Pressed")),
                    );
                  },
                  child: Text("Column Button"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
