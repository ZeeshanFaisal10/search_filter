import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                title: Text('Flutter Apply Search on ListView')
            ),
            body: Center(
                child: ListSearch()
            )
        )
    );
  }
}

class ListSearch extends StatefulWidget {
  @override
  _ListSearchState createState() => _ListSearchState();
}

class _ListSearchState extends State<ListSearch> {

  TextEditingController _textController = TextEditingController();

  static List mainDataList = [
    {
      "title":"Apple",
      "body" : "qwerty"
    },
    {
      "title":"Banana",
      "body" : "qwerty"
    }

  ];
  List newDataList = List.from(mainDataList);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Search Here...',
              ),
              onChanged: onItemChanged,
            ),
          ),
          for(int j=0;j<newDataList.length;j++)
          ExpansionTile(
            title: Text("${newDataList[j]["title"]}"),
            children: [
              Text("${newDataList[j]["body"]}"),
            ],
            )
        ],
      ),
    );
  }


  onItemChanged(String value) {
    setState(() {
      newDataList = mainDataList
          .where((string) => string.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }
}
