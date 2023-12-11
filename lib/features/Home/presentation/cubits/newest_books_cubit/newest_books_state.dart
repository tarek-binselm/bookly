import 'package:bookly_app/features/Home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

abstract  class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object> get props => [];
}

final class NewestBooksInitial extends NewestBooksState {}


final class NewestBooksLoadingState extends NewestBooksState {}

final class NewestBooksFailureState extends NewestBooksState {
  final String errMessage;

  const NewestBooksFailureState(this.errMessage);
}

final class NewestBooksSuccessState extends NewestBooksState {
  final List<BookModel> books;

  const NewestBooksSuccessState(this.books);
}
