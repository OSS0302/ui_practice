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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.blue,
          child: GridView.builder(
            itemCount: 10,   //item 개수
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,   //1 개의 행에 보여줄 item 개수
              childAspectRatio: 1 / 1,   //item 의 가로 1, 세로 2 의 비율
            ),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: (){
                      print('hihihi ${index + 1}');
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        textStyle: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                    child: Text('${index + 1}')

                ),
              );
              // return Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: InkWell(
              //     onTap: (){
              //       print('hihihi ${index + 1}');
              //     },
              //     child: Container(
              //                   color: Colors.green,
              //       child: Center(child: Text('${index + 1}')),
              //                 ),
              //   ),
              // );
            },   //item 의 반목문 항목 형성
          )

        ),
      ),

    );
  }
}

