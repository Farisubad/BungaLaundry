import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bunga_laundry/Routes/barang/barang.dart';

import 'package:bunga_laundry/Routes/barang/edit.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({this.index,this.list});
  @override
  _DetailState createState() => new _DetailState();
}

class _DetailState extends State<Detail> {

void deleteData(){
  var url="http://localhost/laundry_api/api/tb_barang";
  http.post(url, body: {
    'id_barang': widget.list[widget.index]['id_barang']
  });
}

void confirm (){
  
 showDialog(context: context,
  builder: (context) {
 return AlertDialog(
content: new Text("Are You sure want to delete '${widget.list[widget.index]['nama_barang']}'"),
    actions: <Widget>[
      new RaisedButton(
        child: new Text("OK DELETE!",style: new TextStyle(color: Colors.black),),
        color: Colors.red,
        onPressed: (){
          deleteData();
          Navigator.of(context).push(
            new MaterialPageRoute(
              builder: (BuildContext context)=> new Barang(),
            )
          );
        },
      ),
      new RaisedButton(
        child: new Text("CANCEL",style: new TextStyle(color: Colors.black)),
        color: Colors.green,
        onPressed: ()=> Navigator.pop(context),
      ),
    ],
   );
  }
  );

}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("${widget.list[widget.index]['nama_barang']}")),
      body: new Container(
        height: 270.0, 
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[

                new Padding(padding: const EdgeInsets.only(top: 30.0),),
               new Text("Nama Barang : ${widget.list[widget.index]['nama_barang']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Biaya : ${widget.list[widget.index]['biaya']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Total Biaya : ${widget.list[widget.index]['total_biaya']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Catatan : ${widget.list[widget.index]['catatan']}", style: new TextStyle(fontSize: 18.0),),
                new Padding(padding: const EdgeInsets.only(top: 30.0),),

                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new RaisedButton(
                      child: new Text("EDIT"),
                      color: Colors.green,
                      onPressed: ()=>Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (BuildContext context)=>new EditData(list: widget.list, index: widget.index,),
                        )
                      ),
                    ),
                    new RaisedButton(
                      child: new Text("DELETE"),
                      color: Colors.red,
                      onPressed: ()=> confirm(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}