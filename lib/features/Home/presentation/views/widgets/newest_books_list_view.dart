import 'package:bookly_app/core/widgets/custom_toast.dart';
import 'package:bookly_app/features/Home/presentation/cubits/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/Home/presentation/cubits/newest_books_cubit/newest_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'book_list_view_item.dart';
import 'package:flutter/material.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccessState) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return  Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BookListViewItem(
                  booksModel: state.books[index],
                ),
              );
            },
          );
        } else if (state is NewestBooksFailureState) {
         return customToast(msg: state.errMessage);
        } else {
         return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
