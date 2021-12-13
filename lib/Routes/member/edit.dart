import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bunga_laundry/Routes/member/member.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({this.list, this.index});

  @override
  _EditDataState createState() => new _EditDataState();
}

class _EditDataState extends State<EditData> {

  TextEditingController controllerNama;
  TextEditingController controllerUsername;
  TextEditingController controllerAlamat;
  TextEditingController controllerNotelp;
  TextEditingController controllerPassword;




  void editData() {
    var url="http://localhost/laundry_api/api/tb_member";
    http.put(url,body: {
      "id_member": widget.list[widget.index]['id_member'],
      "nama_member": controllerNama.text,
      "username": controllerUsername.text,
      "alamat_member": controllerAlamat.text,
      "no_telp": controllerNotelp.text,
      "password": controllerPassword.text

    });
  }


  @override
    void initState() {
   
      controllerNama= new TextEditingController(text: widget.list[widget.index]['nama_member'] );
      controllerUsername= new TextEditingController(text: widget.list[widget.index]['username'] );
      controllerAlamat= new TextEditingController(text: widget.list[widget.index]['alamat_member'] );
      controllerNotelp= new TextEditingController(text: widget.list[widget.index]['no_telp'] );
       controllerPassword= new TextEditingController(text: widget.list[widget.index]['password'] );
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("EDIT DATA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[

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
                      hintText: "Alamat Biaya", labelText: "Alamat Biaya"),
                ),
                new TextField(
                  controller: controllerNotelp,
                  decoration: new InputDecoration(
                      hintText: "Notelp", labelText: "Notelp"),
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
                  child: new Text("EDIT DATA"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    editData();
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
