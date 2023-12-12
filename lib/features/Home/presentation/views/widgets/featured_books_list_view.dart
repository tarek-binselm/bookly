import 'package:bookly_app/core/widgets/custom_toast.dart';
import 'package:bookly_app/features/Home/presentation/cubits/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/Home/presentation/cubits/featured_books_cubit/featured_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_item.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksFailureState) {
          customToast(msg: state.errMessage);
        }
        return state is FeaturedBooksLoadingState
            ? const Center(child: CircularProgressIndicator())
            : state is FeaturedBooksSuccessState
                ? SizedBox(
                    height: MediaQuery.of(context).size.height * .3,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: state.books.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: CustomBookItem(
                            imageUrl: state
                                .books[index].volumeInfo.imageLinks.thumbnail,
                          ),
                        );
                      },
                    ),
                  )
                : Text((state as FeaturedBooksFailureState).errMessage);
      },
    );
  }
}
