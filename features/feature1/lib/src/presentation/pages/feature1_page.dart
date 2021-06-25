import 'package:feature1/src/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';

/// Feature1 page
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

/// Widget that construct the body of Feature1 page
class Feature1BodyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Feature1Bloc, Feature1State>(
      builder: (context, state) {
        LoggerUtil().info("current state: $state");

        if (state is Empty) {
          return Text('Start loading...');
        } else if (state is Loaded) {
          return Text('Entity loaded');
        } else if (state is Error) {
          LoggerUtil().error(state.message);
          return Text(state.message);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
