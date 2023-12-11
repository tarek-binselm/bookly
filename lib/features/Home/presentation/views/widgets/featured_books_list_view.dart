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
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksLoadingState) {
          const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FeaturedBooksFailureState) {
          customToast(msg: state.errMessage);
        }
      },
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * .3,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: CustomBookItem(),
              );
            },
          ),
        );
      },
    );
  }
}
