import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:innovation_day_pos/UI/product_item.dart';
import 'package:innovation_day_pos/UI/products_grid.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF4484CE),
        cardColor: const Color(0xFFD9D9D9),
        accentColor: const Color(0xFFCDCDCD),
      ),
      home: new MyHomePage(title: 'Amilia'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  InvoiceItems invoiceItemsList = new InvoiceItems();

  void addItemToInvoice(ProductItem item){
    invoiceItemsList.AddItem(item);
  }
  
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
                          color: Theme.of(context).cardColor,
                          child: ProductsGrid(widget.addItemToInvoice)
                        )),
                    Expanded( // container 2: bottom-left
                        flex: 1,
                        child: new Container(
                          margin: const EdgeInsets.all(10.0),
                          color: Theme.of(context).cardColor,
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
                          color: Theme.of(context).cardColor,
                          child: widget.invoiceItemsList,
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

  final _invoiceItems = <ProductItem>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  void AddItem(ProductItem productItem)
  {
    print('Adding invoice item product "' + productItem.name + '"');
    setState(() {
      _invoiceItems.add(productItem);
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

  Widget _buildInvoiceItemRow(ProductItem invoiceItemProduct) {
    print('_buildInvoiceItemRow');
    return ListTile(
      title: Text(
        invoiceItemProduct.name,
        style: _biggerFont,
      ),
      trailing: new Icon(
        Icons.remove_shopping_cart,
        color: Colors.red,
      ),
      onTap: () {
        setState(() {
          _invoiceItems.remove(invoiceItemProduct);
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

    final itemName = WordPair.random().asPascalCase;
    var newItem = new ProductItem(itemName, null);

    AddItem(newItem);

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
  InvoiceItemsState state;

  InvoiceItemsState createState() {
    state = new InvoiceItemsState();
    return state;
  }

  void AddItem(ProductItem productItem) {
    state.AddItem(productItem);
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// end of FGG's stuff
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////