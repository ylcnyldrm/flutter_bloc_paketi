import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocpaketi/counter_bloc/counter_bloc.dart';
import 'package:flutterblocpaketi/counter_bloc/counter_event.dart';
import 'package:flutterblocpaketi/counter_bloc/counter_state.dart';

import 'counter_bloc/thema_cubit.dart';

void main() {
  runApp(BlocPaketi());
}

class BlocPaketi extends StatefulWidget {
  @override
  _BlocPaketiState createState() => _BlocPaketiState();
}

class _BlocPaketiState extends State<BlocPaketi> {
  @override
  Widget build(BuildContext context) {
    debugPrint("_BlocPaketiState build");
    return BlocProvider(
      create: (context) => ThemaCubit(),
      child: BlocBuilder<ThemaCubit, ThemeData>(
        builder: (context, tema) {
          return MaterialApp(
            theme: tema,
            title: "Flutter Bloc Paketi",
            debugShowCheckedModeBanner: false,
            home: BlocProvider(

                create: (context) => CounterBloc(), child: MyHomePage()),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    debugPrint("my home page state build ");
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Blog Paketi"),
      ),
      floatingActionButton: MyActions(),
      body: MyCountainerWidge(),
    );
  }
}

class MyCountainerWidge extends StatelessWidget {
  const MyCountainerWidge({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("MyCountainerWidge build ");
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("buraya yazı geliyor"),
            BlocBuilder<CounterBloc, CounterState>(
                builder: (context, counterState) {
              return Text(counterState.sayac.toString());
            }),
          ],
        ),
      ),
    );
  }
}

class MyActions extends StatelessWidget {
  const MyActions({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("my actions build");
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
            heroTag: 1,
            onPressed: () {
              context.read<CounterBloc>().add(CounterArttir());
              debugPrint("arttır ");
            }),
        FloatingActionButton(
            heroTag: 2,
            onPressed: () {
              debugPrint("azalt ");
              context.read<CounterBloc>().add(CounterAzalt());
            }),
        FloatingActionButton(
            heroTag: 3,
            onPressed: () {
              debugPrint(" ULA THEMAYI DEGİSTİR SÜLO");
              context.read<ThemaCubit>().temaDegistir();
            }),
      ],
    );
  }
}
