import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bunga_laundry/Routes/kategori/kategori.dart';

class Tambah extends StatefulWidget {
  @override
  _TambahState createState() => new _TambahState();
}

class _TambahState extends State<Tambah> {


TextEditingController controllerNama = new TextEditingController();
TextEditingController controllerId = new TextEditingController();


void tambah(){
  var url="http://localhost/laundry_api/api/tb_kategori";
  http.post(url, body: {
    "id_kategori": controllerId.text,
    "nama_kategori": controllerNama.text

  });
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Tambah Kategori"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                 new TextField(
                  controller: controllerId,
                  decoration: new InputDecoration(
                      hintText: "Id Kategori", labelText: "Id Kategori"),
                ),
                new TextField(
                  controller: controllerNama,
                  decoration: new InputDecoration(
                      hintText: "Nama Kategori", labelText: "Nama Kategori"),
                ),

                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text("Tambah Data"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    tambah();
                    Navigator.of(context).push(
                      new MaterialPageRoute(
                        builder: (BuildContext context)=>new Kategori()
                      )
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
