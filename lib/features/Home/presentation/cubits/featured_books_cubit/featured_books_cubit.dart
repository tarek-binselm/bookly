import 'package:bookly_app/features/Home/data/repos/home_repo.dart';
import 'package:bookly_app/features/Home/presentation/cubits/featured_books_cubit/featured_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoadingState());
    var result = await homeRepo.fetchFeaturedBooks();

    result.fold((failure) {
      emit(FeaturedBooksFailureState(failure.errMessage));
    }, (books) {
      emit(FeaturedBooksSuccessState(books));
    });
  }
}
