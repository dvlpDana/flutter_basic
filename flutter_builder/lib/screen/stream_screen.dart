import 'dart:math';
import 'package:flutter/material.dart';

class StreamScreen extends StatefulWidget {
  const StreamScreen({super.key});

  @override
  State<StreamScreen> createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen> {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: 16.0,
    );

    // 캐싱을 잘 활용하면 유저한테 실제 로딩을 하고 있는 상황에서 로딩이 안 걸리고 있는것 처럼 보이게 할 수 있음
    // 이전의 데이터를 기억하고 있다가, 새로운 데이터를 받으면 바꿈

    return Scaffold(
      appBar: AppBar(
        title: Text('StreamBuilder'),
      ),
      body: StreamBuilder<int>(
        stream: streamNumbers(),
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
                  'StreamBuilder',
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

  Stream<int> streamNumbers() async* {
    for (int i = 0; i < 10; i++) {
      if (i == 5) {
        throw Exception('i = 5');
      }

      await Future.delayed(
        Duration(
          seconds: 1,
        ),
      );

      yield i;
    }
  }
}
