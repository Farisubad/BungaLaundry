import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bunga_laundry/Routes/barang/barang.dart';

class Tambah extends StatefulWidget {
  @override
  _TambahState createState() => new _TambahState();
}

class _TambahState extends State<Tambah> {


TextEditingController controllerNama = new TextEditingController();
TextEditingController controllerId = new TextEditingController();
TextEditingController controllerBiaya = new TextEditingController();
TextEditingController controllerTotal = new TextEditingController();
TextEditingController controllerCatatan = new TextEditingController();

void tambah(){
  var url="http://localhost/laundry_api/api/tb_barang";
  http.post(url, body: {
      "id_barang": controllerId.text,
      "nama_barang": controllerNama.text,
      "biaya": controllerBiaya.text,
      "total_biaya": controllerTotal.text,
      "catatan": controllerCatatan.text

  });
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Tambah Barang"),
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
                      hintText: "Id Barang", labelText: "Id Barang"),
                ),
                new TextField(
                  controller: controllerNama,
                  decoration: new InputDecoration(
                      hintText: "Nama Barang", labelText: "Nama Barang"),
                ),
                new TextField(
                  controller: controllerBiaya,
                  decoration: new InputDecoration(
                      hintText: "Biaya", labelText: "Biaya"),
                ),
                new TextField(
                  controller: controllerTotal,
                  decoration: new InputDecoration(
                      hintText: "Total Biaya", labelText: "Total Biaya"),
                ),
                new TextField(
                  controller: controllerCatatan,
                  decoration: new InputDecoration(
                      hintText: "Catatan", labelText: "Catatan"),
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
                        builder: (BuildContext context)=>new Barang()
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
