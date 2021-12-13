import 'package:flutter/material.dart';
import 'package:bunga_laundry/Routes/login.dart';
import 'package:bunga_laundry/Routes/register.dart';
import 'package:bunga_laundry/Routes/home.dart';
import 'package:bunga_laundry/profile/profile.dart';
import 'package:bunga_laundry/profile/profile_edit.dart';
import 'package:bunga_laundry/profile/profile_password.dart';
import 'package:bunga_laundry/order/order.dart';
import 'package:bunga_laundry/notification/notification.dart';
import 'package:bunga_laundry/Routes/Ongoing.dart';
import 'package:bunga_laundry/Routes/kategori/kategori.dart';
import 'package:bunga_laundry/Routes/barang/barang.dart';
import 'package:bunga_laundry/Routes/member/member.dart';
import 'package:flutter/material.dart' hide Router;


class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Home());
      case '/login':
        return MaterialPageRoute(builder: (_) => Login());
      case '/register':
        return MaterialPageRoute(builder: (_) => Register());
      case '/profile':
        return MaterialPageRoute(builder: (_) => Profile());
      case '/profile_edit':
        return MaterialPageRoute(builder: (_) => ProfileEdit());
      case '/profile_password':
        return MaterialPageRoute(builder: (_) => ProfilePassword());
      case '/order':
        return MaterialPageRoute(builder: (_) => Order());
      case '/notification':
        return MaterialPageRoute(builder: (_) => Notif());
      case '/ongoing':
        return MaterialPageRoute(builder: (_) =>Ongoing());
      case '/kategori':
        return MaterialPageRoute(builder: (_) =>Kategori());
      case '/barang':
        return MaterialPageRoute(builder: (_) =>Barang());
      case '/member':
        return MaterialPageRoute(builder: (_) =>Member());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
