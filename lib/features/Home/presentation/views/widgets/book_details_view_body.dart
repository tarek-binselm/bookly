import 'package:bookly_app/features/Home/presentation/views/widgets/book_details_custom_app_bar.dart';
import 'package:bookly_app/features/Home/presentation/views/widgets/books_details_section.dart';
import 'package:bookly_app/features/Home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                BookDetailsCustomAppBar(),
                BookDetailsSection(),
                Expanded(
                  // because i need this section remain at the bottom of the screen
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                SimilarBooksSection(),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
