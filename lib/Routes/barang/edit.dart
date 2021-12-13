import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bunga_laundry/Routes/barang/barang.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({this.list, this.index});

  @override
  _EditDataState createState() => new _EditDataState();
}

class _EditDataState extends State<EditData> {

  TextEditingController controllerName;
  TextEditingController controllerBiaya;
  TextEditingController controllerTotal;
  TextEditingController controllerCatatan;




  void editData() {
    var url="http://localhost/laundry_api/api/tb_barang";
    http.put(url,body: {
      "id_barang": widget.list[widget.index]['id_barang'],
      "nama_barang": controllerName.text,
      "biaya": controllerBiaya.text,
      "total_biaya": controllerTotal.text,
      "catatan": controllerCatatan.text

    });
  }


  @override
    void initState() {
   
      controllerName= new TextEditingController(text: widget.list[widget.index]['nama_barang'] );
      controllerBiaya= new TextEditingController(text: widget.list[widget.index]['biaya'] );
      controllerTotal= new TextEditingController(text: widget.list[widget.index]['total_biaya'] );
      controllerCatatan= new TextEditingController(text: widget.list[widget.index]['catatan'] );
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
                  child: new Text("EDIT DATA"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    editData();
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
