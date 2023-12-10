import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/Search/presentation/views/widgets/search_view_list_view.dart';
import 'package:bookly_app/features/Search/presentation/views/widgets/serch_view_text_field.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          SearchViewTextField(),
          SizedBox(
            height: 16,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Search Result',
              style: Styles.textStyle18,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: SearchViewResultListView(),
          ),
        ],
      ),
    );
  }
}
