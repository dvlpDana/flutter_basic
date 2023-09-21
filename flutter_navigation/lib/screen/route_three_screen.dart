import 'package:flutter/material.dart';
import 'package:flutter_navigation/screen/route_two_screen.dart';
import '../layout/main_layout.dart';

class RouteThreeScreen extends StatelessWidget {
  const RouteThreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)!.settings.arguments;

    return MainLayout(
      title: 'Route Three Screen',
      appBarBgColor: Colors.pink,
      children: [
        Text(
          'arguments : $argument',
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pink,
          ),
          child: Text('Back To HomeScreen'),
        ),
      ],
    );
  }
}
