import 'package:cubit_and_testing/cubit/operator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OperatorCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Cubit and Testing'),
      ),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'The Number is Currently:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            BlocBuilder<OperatorCubit, OperatorState>(
              builder: (context, state) {
                return Text(
                  state.number.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            const SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<OperatorCubit>(context).add();
                  },
                  tooltip: 'Increment',
                  child: const Text('+'),
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<OperatorCubit>(context).substract();
                  },
                  tooltip: 'Decrement',
                  child: const Text('-'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<OperatorCubit>(context).divide();
                  },
                  tooltip: 'Increment',
                  child: const Text('/'),
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<OperatorCubit>(context).multiply();
                  },
                  tooltip: 'Decrement',
                  child: const Text('*'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
