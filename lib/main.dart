import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(widget.title),
      // ),

      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: const CustomPaint(
            size: Size(200, 200), // 위젯의 크기를 정함.
            painter: MyPainter(eyeColor: Colors.red), // painter에 그리기를 담당할 클래스를 넣음.
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter  {
  final Color _eyeColor;

  const MyPainter({Color? eyeColor}): _eyeColor = eyeColor ?? Colors.red;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint() // Paint 클래스는 어떤 식으로 화면을 그릴지 정할 때 쓰임.
      ..color = Colors.deepPurpleAccent // 색은 보라색
      ..strokeCap = StrokeCap.round // 선의 끝은 둥글게 함.
      ..strokeWidth = 4.0; // 선의 굵기는 4.0

    Offset p1 = Offset(size.width * 0.5, 0.0); // 선을 그리기 위한 좌표값을 만듬.
    Offset p2 = Offset(size.width, size.height * 0.5);
    Offset p3 = Offset(size.width * 0.5, size.height);

    Offset p4 = Offset(0, size.height * 0.5);
    // Offset p5 = Offset(size.width * 0.5, 0.0);

    canvas.drawLine(p1, p2, paint); // 선을 그림.
    canvas.drawLine(p2, p3, paint); // 선을 그림.
    canvas.drawLine(p3, p4, paint); // 선을 그림.
    canvas.drawLine(p4, p1, paint); // 선을 그림.

    Path path = Path();

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
    // return _eyeColor != oldDelegate._eyeColor;
  }

}
