import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Color Game',
        home: Scaffold(
            appBar: AppBar(title: const Text('Color Game')),
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(     
                      mainAxisAlignment: MainAxisAlignment.center, 
                      crossAxisAlignment: CrossAxisAlignment.center,                
                      children:const <Widget>[                                        
                        CircleButton(size:50, color:Colors.red),
                        VerticalDivider(width: 10,),
                        CircleButton(size:50.0, color:Colors.yellow),
                    ]),
                    Container(
                      height: 10,
                    ),
                    Row(     
                      mainAxisAlignment: MainAxisAlignment.center, 
                      crossAxisAlignment: CrossAxisAlignment.center,                
                      children:const <Widget>[                                        
                        CircleButton(size:50, color:Colors.blue),
                        VerticalDivider(width: 10,),
                        CircleButton(size:50.0, color:Colors.green),
                    ]),
                  const Text("Welcome to the color game!",textAlign: TextAlign.center,), 
                ])));
  }
}

class CircleButton extends StatelessWidget {
  final double? size;
  final Color? color;

  const CircleButton({super.key, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return InkResponse(
        onTap: () {},
        radius: size! / 2,
        child: Container(
            width:size,
            height: size,
            decoration:
                BoxDecoration(color: color, shape: BoxShape.circle)));
  }
}
