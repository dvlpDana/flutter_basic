import 'package:flutter/material.dart';
import 'package:flutter_navigation/layout/main_layout.dart';
import 'package:flutter_navigation/screen/route_two_screen.dart';

class RouteOneScreen extends StatelessWidget {
  final int? number;

  const RouteOneScreen({this.number, super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Route One Screen',
      appBarBgColor: Colors.orange,
      children: [
        Text(
          number.toString(),
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(456);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
          ),
          child: Text('Back To HomeScreen'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => RouteTwoScreen(),
                settings: RouteSettings(
                  arguments: 789,
                )
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
          ),
          child: Text('Push RouteTwoScreen'),
        ),
        ElevatedButton(
          onPressed: () {
            // [HomeScreen(),RouteOneScreen() ,RouteTwoScreen()]
            // 바로 전의 경로를 지움 [HomeScreen(), RouteTwoScreen()]
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => RouteTwoScreen(),
              ),
            );
          },
          child: Text('Push Replaced RouteTwoScreen'),
        )
      ],
    );
  }
}
