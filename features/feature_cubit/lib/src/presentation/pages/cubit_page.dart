import 'package:feature_cubit/src/presentation/cubit/feature_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';

class CubitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FeatureCubit>(
        create: (context) =>
            InjectionModule.injector()..getFeatureCubitEntitiesToState(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Feature Cubit'),
          ),
          body: SafeArea(
            child: Center(
              child: Content(),
            ),
          ),
        ));
  }
}

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatureCubit, FeatureCubitState>(
      builder: (context, state) {
        if (state is FeatureCubitInitial) {
          return Text('Start loading...');
        } else if (state is FeatureCubitLoaded) {
          return Text('Entity loaded');
        } else if (state is FeatureCubitError) {
          return Text(state.message);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
