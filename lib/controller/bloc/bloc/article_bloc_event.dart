part of 'article_bloc_bloc.dart';

@immutable
abstract class ArticleBlocEvent {}

class GetData extends ArticleBlocEvent {
  final String urL;

  GetData(this.urL);
}
