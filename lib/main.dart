import 'package:flutter/material.dart';
import 'dart:math';
// import 'old_second_page.dart';
import 'second_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
      routes: {
        '/second': (context) => SecondPage(),
      },
    );
  }
}

class FirstPage extends StatelessWidget {
  final List<int> randomNumbers = List.generate(24, (index) => Random().nextInt(5) + 1);
  final List<int> positions = [2, 5, 8]; // กำหนดตำแหน่งที่ต้องการตรวจสอบ

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView with Random Numbers'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 4, // จำนวนคอลัมน์
          crossAxisSpacing: 8.0, // ระยะห่างระหว่างคอลัมน์
          mainAxisSpacing: 8.0, // ระยะห่างระหว่างแถว
          children: List.generate(24, (index) {
            return Container(
              color: Colors.blue, // สีของช่อง
              child: Center(
                child: Text(
                  '${randomNumbers[index]}',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/second',
            arguments: {
              'randomNumbers': randomNumbers,
              'positions': positions,
            },
          );
        },
        backgroundColor: Colors.white.withOpacity(0.6), // ปรับความเบลอของสี
        child: Text(
          '.',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
      ),
    );
  }
}
