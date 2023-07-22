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


    Path path = Path();
    Paint paint = Paint();

    path.moveTo(size.width*0.5, 0);

    path.lineTo(size.width, size.height * 0.5);

    path.lineTo(size.width * 0.5, size.height);

    path.lineTo(0, size.height * 0.5);

    path.lineTo(size.width*0.5, 0);
    paint.color = _eyeColor;
    // paint.color = Colors.black87;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
    // return _eyeColor != oldDelegate._eyeColor;
  }

}
