import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:band_names/models/band.dart';

class home_page extends StatefulWidget {
  const home_page({Key key}) : super(key: key);

  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  List<Band> bands = [
    Band(id: '1', name: 'Metalica', votes: 1),
    Band(id: '2', name: 'Queen', votes: 2),
    Band(id: '3', name: 'Heroes del cilencio', votes: 3),
    Band(id: '4', name: 'Bon Jovi', votes: 4),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BandNames', style: TextStyle(color: Colors.black87)),
        elevation: 1,
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (BuildContext context, int index) =>
            _bandTile(bands[index]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: addNewBand,
        elevation: 1,
      ),
    );
  }

  Widget _bandTile(Band band) {
    return Dismissible(
      //ayuda a que se mueva el elemento de la lista y que se pueda quitar
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direcrtion) {
        print('direction: $direcrtion');
      },
      background: Container(
        padding: EdgeInsets.only(left: 8.0),
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Delete Band',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(band.name.substring(0, 2)),
          backgroundColor: Colors.blue[100],
        ),
        title: Text(band.name),
        trailing: Text('${band.votes}', style: TextStyle(fontSize: 20)),
        onTap: () {
          print(band.name);
        },
      ),
    );
  }

  addNewBand() {
    final textController = new TextEditingController();

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('New Band Name'),
            content: TextField(
              controller: textController,
            ),
            actions: <Widget>[
              MaterialButton(
                child: Text('Add'),
                elevation: 5,
                textColor: Colors.blue,
                onPressed: () => addbandToList(textController.text),
              )
            ],
          );
        });
  }

  void addbandToList(String name) {
    print(name);
    this
        .bands
        .add(new Band(id: DateTime.now().toString(), name: name, votes: 0));
    setState(() {});
    if (name.length > 1) {}

    Navigator.pop(context);
  }
}
