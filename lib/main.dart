import 'package:cubit_test/color_changer/color_changer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _color1 = Colors.blue;
  Color _color2 = Colors.red;
  Color _color3 = Colors.green;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ColorChangerCubit()..changeColors(),
      child: BlocBuilder<ColorChangerCubit, ColorChangerState>(
        builder: (context, state) {
          state.maybeWhen(
            orElse: () => null,
            color1: (color) => _color1 = color,
            color2: (color) => _color2 = color,
            color3: (color) => _color3 = color,
          );
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    color: _color1,
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: _color2,
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: _color3,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
