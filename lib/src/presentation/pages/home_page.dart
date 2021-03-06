import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular_architecture/src/application/route/router.gr.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: Text('Feature1'),
              onTap: () {
                context.router.push(Feature1Route());
              },
            ),
            ListTile(
              title: Text('Feature Cubit'),
              onTap: () {
                context.router.push(CubitRoute());
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('HomePage'),
      ),
    );
  }
}
