import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String statusMessage = '今天也要加油 !!';

  void updateStatus() {
    setState(() {
      statusMessage =
          statusMessage == '今天也要加油 !!' ? '我想我還是躺平好了...' : '今天也要加油 !!';
    });
  }

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
              SizedBox(height: 20),
              Text(
                statusMessage,
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: updateStatus,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [Icon(Icons.refresh), Text("更新文字")],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
