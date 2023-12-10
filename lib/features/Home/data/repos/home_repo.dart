import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/Home/data/models/book_model/book_model.dart';
import 'package:either_dart/either.dart';

abstract class HomeRepo {
Future<Either<Failure ,List<BookModel> >>  fetchFeaturedBooks();
  fetchBestSellerBooks();
}