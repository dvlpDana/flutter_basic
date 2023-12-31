import 'dart:math';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: 16.0,
    );

    // 캐싱을 잘 활용하면 유저한테 실제 로딩을 하고 있는 상황에서 로딩이 안 걸리고 있는것 처럼 보이게 할 수 있음
    // 이전의 데이터를 기억하고 있다가, 새로운 데이터를 받으면 바꿈

    return Scaffold(
      appBar: AppBar(
        title: Text('FutrueBuilder'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/stream_widget');
            },
            icon: Icon(Icons.toggle_on),
          )
        ],
      ),

      body: FutureBuilder(
        future: getNumber(),
        builder: (context, snapshot) {
          // 데이터가 있을 때, 위젯 렌더링
          if (snapshot.hasData) {}

          // 에러가 났을 때, 위젯 렌더링
          if (snapshot.hasError) {}

          // 로딩중일 때 위젯 렌더링
          //   return Center(
          //     child: CircularProgressIndicator(),
          //   );

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'FutureBuilder',
                  style: textStyle.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  'ContState: ${snapshot.connectionState}',
                  style: textStyle,
                ),
                Text(
                  'Data: ${snapshot.data}',
                  style: textStyle,
                ),
                Text(
                  'Error: ${snapshot.error}',
                  style: textStyle,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text('setState'),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Future<int> getNumber() async {
    await Future.delayed(Duration(seconds: 3));

    final random = Random();

    // throw Exception('에러가 발생했습니다.');

    return random.nextInt(100);
  }
}