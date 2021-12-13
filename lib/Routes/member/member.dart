import 'package:bunga_laundry/Routes/member/detail.dart';
import 'package:flutter/material.dart';
import 'package:bunga_laundry/Routes/member/member.dart';
import 'package:bunga_laundry/Routes/member/tambah.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class Member extends StatefulWidget {
  @override
  _MemberState createState() => new _MemberState();
}

class _MemberState extends State<Member> {
  Future<List> getData() async {
    final response = await http.get("http://localhost/laundry_api/api/tb_member");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Member"),
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
                title: new Text(list[i]['nama_member']),
                leading: new Icon(Icons.widgets),
                 subtitle: new Text("Username : ${list[i]['username']}"),
                
              ),
            ),
          ),
        );
      },
    );
  }
}