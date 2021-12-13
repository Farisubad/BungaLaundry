import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bunga_laundry/Routes/kategori/kategori.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({this.list, this.index});

  @override
  _EditDataState createState() => new _EditDataState();
}

class _EditDataState extends State<EditData> {

  TextEditingController controllerName;



  void editData() {
    var url="http://localhost/laundry_api/api/tb_kategori";
    http.put(url,body: {
      "id_kategori": widget.list[widget.index]['id_kategori'],
      "nama_kategori": controllerName.text,

    });
  }


  @override
    void initState() {
   
      controllerName= new TextEditingController(text: widget.list[widget.index]['nama_kategori'] );
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
                  controller: controllerName,
                  decoration: new InputDecoration(
                      hintText: "Nama Kategori", labelText: "Nama_Kategori"),
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
