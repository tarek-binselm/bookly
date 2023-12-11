
import 'package:flutter/material.dart';

import '../../../../Home/presentation/views/widgets/book_list_view_item.dart';

class SearchViewResultListView extends StatelessWidget {
  const SearchViewResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(),
        );
      },
    );
  }
}
