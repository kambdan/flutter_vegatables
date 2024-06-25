// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final ValueChanged<String> onSearch;

  const SearchBar({Key? key, required this.onSearch}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _controller = TextEditingController();

  void _handleSearch() {
    widget.onSearch(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          labelText: 'Buscar',
          suffixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: _handleSearch,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onSubmitted: (value) => _handleSearch(),
      ),
    );
  }
}
