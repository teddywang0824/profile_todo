import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 8,
        margin: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.greenAccent,
                child: Image.asset('assets/img.png'),
              ),
              SizedBox(height: 16),
              Text(
                '王小明',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                'Flutter 學習者',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              Divider(height: 30, thickness: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone, color: Colors.teal),
                  SizedBox(width: 8),
                  Text('0900-123-456'),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.email, color: Colors.teal),
                  SizedBox(width: 8),
                  Text('example@mail.com'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}