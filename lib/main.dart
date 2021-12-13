import 'package:bunga_laundry/routes.dart';
import 'package:flutter/material.dart' hide Router;

void main() => runApp(
      new MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Router.generateRoute,
        initialRoute: '/ongoing',
      ),
    );
