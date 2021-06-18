import 'package:feature1/src/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';

class Feature1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<Feature1Bloc>(
      create: (context) =>
          InjectionModule.injector()..add(LoadFeature1Entity()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Feature1'),
        ),
        body: SafeArea(
          child: Center(
            child: Feature1BodyPage(),
          ),
        ),
      ),
    );
  }
}

class Feature1BodyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Feature1Bloc, Feature1State>(
      builder: (context, state) {
        if (state is Empty) {
          return Text('Start loading...');
        } else if (state is Loaded) {
          return Text('Entity loaded');
        } else if (state is Error) {
          return Text(state.message);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
