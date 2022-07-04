part of 'article_bloc_bloc.dart';

@immutable
abstract class ArticleBlocState {}

class ArticleBlocInitial extends ArticleBlocState {}

class ArticleBlocOnProcess extends ArticleBlocState {}

class ArticleBlocOndone extends ArticleBlocState {
  final GetNewsDetails data;

  ArticleBlocOndone(this.data);
}
