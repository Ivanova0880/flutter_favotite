import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple App',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: PersonWidget(),
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = false;
  int _favoriteCount = 677;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: IconButton(
            onPressed: _toggleFavorite,
            color: Colors.red[500],
            icon: (_isFavorited
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border)),
          ),
        ),
        SizedBox(
          width: 40,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
        _favoriteCount -= 1;
      } else {
        _isFavorited = true;
        _favoriteCount += 1;
      }
    });
  }
}

class PersonWidget extends StatelessWidget {
  const PersonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Япония. Котики'),
      ),
      body: Container(
        child: _buildMainColumn(),
      ),
    );
  }

  Widget _buildMainColumn() => ListView(
        children: [
          _builTopImage(),
          Center(
            child: Container(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: _buildRaiting(),
                  ),
                  Card(
                    elevation: 5,
                    margin: const EdgeInsets.all(5),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: _buildAction(),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: _buildDesc(),
                  ),
                ],
              ),
            ),
          )
        ],
      );
  Widget _builTopImage() => Container(
        child: Card(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 10,
          ),
          elevation: 5,
          child: Image.asset(
            'assets/images/cat_2.jpg',
            fit: BoxFit.cover,
          ),
        ),
      );

  Widget _buildRaiting() => ListTile(
        title: Text(
          'Принцесса Милашка',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
        subtitle: Text('Аниме. Япония'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [FavoriteWidget()],
        ),
      );
  Widget _buildAction() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildButton('Принцесса', Icons.star, Colors.black),
          _buildButton('Рост 15 см', Icons.topic, Colors.black),
          _buildButton('Возраст 1 год', Icons.auto_graph, Colors.black),
        ],
      );

  Widget _buildButton(String label, IconData icon, Color color) => Column(
        children: [
          Icon(
            icon,
            color: Colors.black,
          ),
          Container(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
  Widget _buildDesc() => Text(
        'Милашка милашкина Милашка милашкина Милашка милашкина Милашка милашкина',
        softWrap: true,
        style: TextStyle(fontSize: 16),
      );
}
