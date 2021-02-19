import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_2/main.dart';

class RandomWordState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('学习列表',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list),color: Colors.white, onPressed: _pushSaved)
        ],
      ),
      body: _buildList(),
    );
  }

  //
  final _suggestions = <WordPair>[];
  final _bigFont = const TextStyle(fontSize: 18.0);

  //收藏列表
  final _saved = new Set<WordPair>();

  // 对于Flutter 全是widget
  Widget _buildRow(WordPair wordPair) {
    final _alreadySaved = _saved.contains(wordPair);
    return new ListTile(
      title: new Text(
        wordPair.asPascalCase,
        style: _bigFont,
      ),
      trailing: new Icon(
        _alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: _alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (_alreadySaved) {
            _saved.remove(wordPair);
          } else {
            _saved.add(wordPair);
          }
        });
      },
    );
  }

  Widget _buildList() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) {
            return new Divider();
          }
          // ~/2 向下取整
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _bigFont,
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return new Scaffold(
            appBar: new AppBar(
              title: new Text("我的收藏",style: TextStyle(color: Colors.white),),
              leading: IconButton(icon:Icon(Icons.arrow_back,color: Colors.white),
                  onPressed: ()=>Navigator.of(context).pop()),
            ),
            body: new ListView(
              children: divided,
            ),
          );
        },
      ),
    );
  }
}
