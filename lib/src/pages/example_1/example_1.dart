import 'package:flutter/material.dart';
import 'package:provider_example/src/pages/example_1/widget/shopping_icons.dart';

import 'model/product_model.dart';
import 'server/server.dart';
import 'utils/product_tile.dart';
import 'widget/product_widget.dart';

final GlobalKey<ShoppingCartIconState> shoppingCart =
GlobalKey<ShoppingCartIconState>();
final GlobalKey<ProductListWidgetState> productList =
GlobalKey<ProductListWidgetState>();


class MyStorePage extends StatefulWidget {
  const MyStorePage({Key? key}) : super(key: key);

  @override
  MyStorePageState createState() => MyStorePageState();
}

class MyStorePageState extends State<MyStorePage> {
  bool _inSearch = false;
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  void _toggleSearch() {
    setState(() {
      _inSearch = !_inSearch;
    });

    _controller.clear();
    productList.currentState!.productList = Server.getProductList();
  }

  void _handleSearch() {
    _focusNode.unfocus();
    final String filter = _controller.text;
    productList.currentState!.productList =
        Server.getProductList(filter: filter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.network('$baseAssetURL/google-logo.png'),
            ),
            title: _inSearch
                ? TextField(
              autofocus: true,
              focusNode: _focusNode,
              controller: _controller,
              onSubmitted: (_) => _handleSearch(),
              decoration: InputDecoration(
                hintText: 'Search Google Store',
                prefixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: _handleSearch),
                suffixIcon: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: _toggleSearch),
              ),
            )
                : null,
            actions: [
              if (!_inSearch)
                IconButton(
                  onPressed: _toggleSearch,
                  icon: const Icon(Icons.search, color: Colors.black),
                ),
              ShoppingCartIcon(key: shoppingCart),
            ],
            backgroundColor: Colors.white,
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: ProductListWidget(key: productList),
          ),
        ],
      ),
    );
  }
}


const String baseAssetURL =
    'https://dartpad-workshops-io2021.web.app/inherited_widget/assets';

const Map<String, Product> kDummyData = {
  '0': Product(
    id: '0',
    title: 'Explore Pixel phones',
    description: TextSpan(children: <TextSpan>[
      TextSpan(
        text: 'Capture the details.\n',
        style: TextStyle(color: Colors.black),
      ),
      TextSpan(
        text: 'Capture your world.',
        style: TextStyle(color: Colors.blue),
      ),
    ]),
    pictureURL: '$baseAssetURL/pixels.png',
  ),
  '1': Product(
    id: '1',
    title: 'Nest Audio',
    description: TextSpan(children: <TextSpan>[
      TextSpan(text: 'Amazing sound.\n', style: TextStyle(color: Colors.green)),
      TextSpan(text: 'At your command.', style: TextStyle(color: Colors.black)),
    ]),
    pictureURL: '$baseAssetURL/nest.png',
  ),
  '2': Product(
    id: '2',
    title: 'Nest Audio Entertainment packages',
    description: TextSpan(children: <TextSpan>[
      TextSpan(
        text: 'Built for music.\n',
        style: TextStyle(color: Colors.orange),
      ),
      TextSpan(
        text: 'Made for you.',
        style: TextStyle(color: Colors.black),
      ),
    ]),
    pictureURL: '$baseAssetURL/nest-audio-packages.png',
  ),
  '3': Product(
    id: '3',
    title: 'Nest Home Security packages',
    description: TextSpan(children: <TextSpan>[
      TextSpan(text: 'Your home,\n', style: TextStyle(color: Colors.black)),
      TextSpan(text: 'safe and sound.', style: TextStyle(color: Colors.red)),
    ]),
    pictureURL: '$baseAssetURL/nest-home-packages.png',
  ),
};
