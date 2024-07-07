import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello World'),
          backgroundColor: Colors.green,
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          height: 150,
          child: Row(
            children: [
              Image.asset('carina.jpg', width: 150,),
              Container(
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Carina'),
                    Text('유지민'),
                    Text('aespa'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.favorite),
                        Text("4")
                      ],
                    )
                  ],
                ),
              ),
            ],
          )
        )
      )
    );
  }
}
