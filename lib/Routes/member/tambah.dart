import 'package:bunga_laundry/Routes/member/member.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bunga_laundry/Routes/barang/barang.dart';

class Tambah extends StatefulWidget {
  @override
  _TambahState createState() => new _TambahState();
}

class _TambahState extends State<Tambah> {


TextEditingController controllerId = new TextEditingController();
TextEditingController controllerNama = new TextEditingController();
TextEditingController controllerUsername = new TextEditingController();
TextEditingController controllerAlamat = new TextEditingController();
TextEditingController controllerNotelp = new TextEditingController();
TextEditingController controllerPassword = new TextEditingController();

void tambah(){
  var url="http://localhost/laundry_api/api/tb_member";
  http.post(url, body: {
      "id_member": controllerId.text,
      "nama_member": controllerNama.text,
      "username": controllerUsername.text,
      "alamat_member": controllerAlamat.text,
      "no_telp": controllerNotelp.text,
      "password": controllerPassword.text

  });
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Tambah Member"),
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
                      hintText: "Id Member", labelText: "Id Member"),
                ),
                 new TextField(
                  controller: controllerNama,
                  decoration: new InputDecoration(
                      hintText: "Nama Member", labelText: "Nama Member"),
                ),
                new TextField(
                  controller: controllerUsername,
                  decoration: new InputDecoration(
                      hintText: "Usernama", labelText: "Username"),    
                ),
                new TextField(
                  controller: controllerAlamat,
                  decoration: new InputDecoration(
                      hintText: "Alamat Member", labelText: "Alamat Member"),
                ),
                new TextField(
                  controller: controllerNotelp,
                  decoration: new InputDecoration(
                      hintText: "No telp", labelText: "No telp"),
                ),
                new TextField(
                  controller: controllerPassword,
                  decoration: new InputDecoration(
                      hintText: "Password", labelText: "Password"),
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
                        builder: (BuildContext context)=>new Member()
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
