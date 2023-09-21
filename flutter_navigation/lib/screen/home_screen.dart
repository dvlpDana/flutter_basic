import 'package:flutter/material.dart';
import 'package:flutter_navigation/layout/main_layout.dart';
import 'package:flutter_navigation/screen/route_three_screen.dart';
import 'package:flutter_navigation/screen/route_one_screen.dart';
import 'package:flutter_navigation/screen/route_two_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // 안드로이드에서 시스템 버튼으로 뒤로가기를 눌러서 앱이 종료되는 것을 막으려면
      // WillPopScope 위젯으로 감싸서 더이상 뒤로 갈 수 있는 route stack이 없으면
      // 뒤로가기 버튼을 막는 로직을 추가해주어야 함
      onWillPop: () async {
        // true - pop 가능
        // false - pop 불가능
        final canPop = Navigator.of(context).canPop();

        return canPop;
      },
      child: MainLayout(
        title: 'Home Screen',
        appBarBgColor: Colors.blue,
        children: [
          ElevatedButton(
            onPressed: () async {
              final result = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => RouteOneScreen(
                    number: 123,
                  ),
                ),
              );

              print(result);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
            ),
            child: Text('RouteOneScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              // maybePop은 뒤로 갈 스크린이 있을 때만 동작함, pop은 뒤로 갈 route stack 없어도 동작하므로 error 발생시킬 수 있음
              Navigator.of(context).maybePop();
            },
            child: Text('Maybe Pop'),
          ),
        ],
      ),
    );
  }
}
