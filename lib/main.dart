import 'package:cubit_test/bloc_observer.dart';
import 'package:cubit_test/color_changer/color_changer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: SimpleBlocObserver(),
  );
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

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _color1 = Colors.blue;
  Color _color2 = Colors.red;
  Color _color3 = Colors.green;
  late final ColorChangerCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = ColorChangerCubit();
    Future.delayed(const Duration(seconds: 5), _cubit.changeColors);
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocBuilder<ColorChangerCubit, ColorChangerState>(
        bloc: _cubit,
        builder: (context, state) {
          state.maybeWhen(
            orElse: () => null,
            color1: (color) => _color1 = color,
            color2: (color) => _color2 = color,
            color3: (color) => _color3 = color,
          );
          print("_color1: $_color1");
          print("_color2: $_color2");
          print("_color3: $_color3");
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
