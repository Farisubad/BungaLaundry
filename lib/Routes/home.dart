import 'package:flutter/material.dart';
import 'package:bunga_laundry/components/home_component.dart';
import 'package:bunga_laundry/home_content.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Colors.blue,
                Colors.lightBlue,
              ],
            ),
          ),
        ),
        title: Text('Bunga Laundry'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () => Navigator.pushNamed(context, "/notification"),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 40.0),
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        offset: const Offset(2.0, 4.0),
                        blurRadius: 8),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(60.0)),
                  child: Image.asset('assets/avatar.png'),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
              child: Text(
                'Ade khairunisa',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey.withOpacity(0.9),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Beranda'),
              onTap: () => Navigator.pushReplacementNamed(context, '/'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profil'),
              onTap: () => Navigator.pushNamed(context, '/profile'),
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Riwayat Cucian'),
              onTap: () => Navigator.pushNamed(context, '/order'),
            ),
            Expanded(child: Container()),
            Column(
              children: <Widget>[
                _createFooterItem(
                  icon: Icons.exit_to_app,
                  text: 'Log Out',
                  onTap: () =>
                      Navigator.pushReplacementNamed(context, '/login'),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Selamat Datang',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            letterSpacing: 0.2,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          'Ade khairunisa',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            letterSpacing: 0.27,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    child: Image.asset('assets/avatar.png'),
                  )
                ],
              ),
            ),
          ),
          Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    'Layanan Bunga Laundry',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                      letterSpacing: 0.27,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
                
                Column(
                children: [
                new GestureDetector(
                onTap: () =>
                Navigator.pushReplacementNamed(context, '/kategori'),
                child: new Card(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: new Text('Kategori'),
                    )
                  ],
                ),
              ),
            ),
          ],
          ),
            Column(
                children: [
                new GestureDetector(
                onTap: () =>
                Navigator.pushReplacementNamed(context, '/barang'),
                child: new Card(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: new Text("Barang"),
                    )
                  ],
                ),
              ),
            ),
          ],
          ),
          Column(
                children: [
                new GestureDetector(
                onTap: () =>
                Navigator.pushReplacementNamed(context, '/member'),
                child: new Card(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: new Text("Member"),
                    )
                  ],
                ),
              ),
            ),
          ],
          ),

            ],
          ),
        ],
      ),
    );
  }
}

Widget _createFooterItem(
    {IconData icon, String text, GestureTapCallback onTap}) {
  return Container(
    color: Colors.black12,
    child: ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      onTap: onTap,
    ),
  );
}
