import 'package:bunga_laundry/Routes/barang/detail.dart';
import 'package:flutter/material.dart';
import 'package:bunga_laundry/Routes/barang/barang.dart';
import 'package:bunga_laundry/Routes/barang/tambah.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class Barang extends StatefulWidget {
  @override
  _BarangState createState() => new _BarangState();
}

class _BarangState extends State<Barang> {
  Future<List> getData() async {
    final response = await http.get("http://localhost/laundry_api/api/tb_barang");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Barang"),
      ),
       floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: ()=>Navigator.of(context).push(
          new MaterialPageRoute(
            builder: (BuildContext context)=> new Tambah(),
          )
        ),
      ),

      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: ()=>Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context)=> new Detail(list:list , index: i,),
              )
            ),
            child: new Card(

              child: new ListTile(
                title: new Text(list[i]['nama_barang']),
                leading: new Icon(Icons.widgets),
                
              ),
            ),
          ),
        );
      },
    );
  }
}