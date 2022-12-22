import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _currentFilter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return SafeArea(
      child: Column(
        children: [
          Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                color: Theme.of(context).primaryColor,
                child: TextField(
                  style: Theme.of(context).textTheme.bodyText1,
                  decoration: const InputDecoration(
                    hintText: 'Procure pela musica que quer ouvir',
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 24),
                        _filterSelector(name: 'Músicas', index: 0),
                        _filterSelector(name: 'Artistas', index: 1),
                        _filterSelector(name: 'Playlists', index: 2),
                        _filterSelector(name: 'Podcasts', index: 3),
                        _filterSelector(name: 'Video clips', index: 4),
                        _filterSelector(name: 'Contas', index: 5),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              children: const [
                SizedBox(height: 20),
                Text('teste'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _filterSelector({required String name, required int index}) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: GestureDetector(
        onTap: () => setState(() {
            _currentFilter = index;
          }),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          decoration: BoxDecoration(
            color: _currentFilter == index ? Colors.green : Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            name,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(color: _currentFilter == index ? Colors.white : Colors.green,),
          ),
        ),
      ),
    );
  }
}
