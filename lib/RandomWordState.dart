import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_2/main.dart';

class RandomWordState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('xxxx'),
      ),
      body: _buildList(),
    );
  }

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
}
