import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Amilia'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
        appBar: new AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: new Text(widget.title),
        ),
        body: new Row(
          children: <Widget>[
            Expanded(
                flex: 3,
                child: Column(
                  children: <Widget>[
                    Expanded( // container 1: top-left
                        flex: 6,
                        child: new Container(
                          margin: const EdgeInsets.all(10.0),
                          color: const Color(0xFF00FF00),
                          //child: new Text('Hello World 1'),
                        )),
                    Expanded( // container 2: bottom-left
                        flex: 1,
                        child: new Container(
                          margin: const EdgeInsets.all(10.0),
                          color: const Color(0xFF00FF00),
                          //child: new Text('Hello World 2'),
                        ))
                  ],
                )),
            Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Expanded( // container 3: right
                        flex: 6,
                        child: new Container(
                          margin: const EdgeInsets.all(10.0),
                          color: const Color(0xFF00FF00),
                          child: InvoiceItems(),
                        ))
                  ],
                )),
          ],
        ));
  }
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// FGG's stuff
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class InvoiceItemsState extends State<InvoiceItems> {
  @override

  final _invoiceItems = <String>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  void AddItem(String invoiceItemString)
  {
    print('Adding invoice item "' + invoiceItemString + '"');
    setState(() {
      _invoiceItems.add(invoiceItemString);
    });
    print('Added invoice item');
  }

  Widget _buildInvoiceItems() {
    print('_buildInvoiceItems');
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();
          final index = i ~/ 2;
          print('_invoiceItems.length = ' + _invoiceItems.length.toString() + ', index = ' + index.toString());
          return _invoiceItems.length == 0 || index >= _invoiceItems.length ? _buildEmptyRow() : _buildInvoiceItemRow(_invoiceItems[index]);
        }
    );
  }

  Widget _buildEmptyRow() {
    print('_buildEmptyRow');
    return ListTile(
      title: Text(
        "",
        style: _biggerFont,
      ),
    );
  }

  Widget _buildInvoiceItemRow(String invoiceItemString) {
    print('_buildInvoiceItemRow');
    return ListTile(
      title: Text(
        invoiceItemString,
        style: _biggerFont,
      ),
      trailing: new Icon(
        Icons.remove_shopping_cart,
        color: Colors.red,
      ),
      onTap: () {
        setState(() {
          _invoiceItems.remove(invoiceItemString);
        });
      },
    );
  }

  Widget build(BuildContext context) {
    print('build');
    return Scaffold (
      appBar: AppBar(
        title: Text('Invoice info'),
        actions: <Widget>[
          new IconButton(icon: const Icon(Icons.list), onPressed: _addInvoiceItem),
        ],
      ),
      body: _buildInvoiceItems(),
    );
  }

  void _addInvoiceItem() {
    print('_addInvoiceItem');
    final invoiceItemWordPair = WordPair.random();
    AddItem(invoiceItemWordPair.asPascalCase);

    /* THIS IS FOR SHOWING A CLIENTS SECTION MAYBE? I DUNNO
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
                (WordPair pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );

          final List<Widget> divided = ListTile
              .divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return new Scaffold(
            appBar: new AppBar(
              title: const Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );*/
  }
}

class InvoiceItems extends StatefulWidget {
  @override
  InvoiceItemsState createState() => new InvoiceItemsState();
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// end of FGG's stuff
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////