import 'package:flutter/material.dart';
import 'package:flutter_navigation/layout/main_layout.dart';
import 'package:flutter_navigation/screen/route_three_screen.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;

    return MainLayout(
      title: 'Route Two Screen',
      appBarBgColor: Colors.green,
      children: [
        Text(
          'arguments : $arguments',
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
          ),
          child: Text('Back To Screen'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
              '/three',
              arguments: 999,
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pink,
          ),
          child: Text('PushNamed RouteThreeScreen'),
        ),
        ElevatedButton(
          onPressed: () {
            // (route) => false : appBar에서 뒤로 가기 버튼이 안보이게 됨. RouteThreeScreen 뒤에 있는 Screen 이 모두 사라졌기 때문임
            // (route) => route.settings.name == '/' : HomeScreen만 살아있음
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (_) => RouteThreeScreen(),
              ),
              (route) => route.settings.name == '/',
            );
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
          child: Text('Push And Remove Until'),
        ),
        ElevatedButton(
          onPressed: () {
            // canPop은 뒤로 이동할 route stack이 있는지 없는지를 bool 값으로 반환함
            // maybePop은 canPop이 true일 때 동작함
            print(Navigator.of(context).canPop());
          },
          child: Text('Maybe Pop'),
        )
      ],
    );
  }
}
