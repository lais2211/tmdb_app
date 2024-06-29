// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../l10n/movie_l10n.dart';

class SearchSection extends StatefulWidget {
  TextEditingController searchController;
  String searchText;
  SearchSection({
    super.key,
    required this.searchController,
    required this.searchText,
  });

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  final MovieL10n text = MovieL10n();

 void navigateToSearchPage(String searchText) {
    if (searchText.isEmpty) return;

    Modular.to.pushNamed('/tmdb/search',
                  arguments: widget.searchText);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextField(
          controller: widget.searchController,
          onChanged: (value) {
              setState(() {
                widget.searchText = value;
              });
            },
          onSubmitted: navigateToSearchPage,
          decoration: InputDecoration(
            hintText: text.Search,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        )),
        const SizedBox(
          width: 8,
        ),
        IconButton(
            onPressed: () {
              navigateToSearchPage(widget.searchText);
            },
            icon: const Icon(Icons.search_rounded)),
      ],
    );
  }
}
