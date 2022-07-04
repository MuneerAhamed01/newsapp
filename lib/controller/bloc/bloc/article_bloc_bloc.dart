import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:newsapp/model/data_model/data_model.dart';

part 'article_bloc_event.dart';
part 'article_bloc_state.dart';

class ArticleBlocBloc extends Bloc<ArticleBlocEvent, ArticleBlocState> {
  ArticleBlocBloc() : super(ArticleBlocInitial()) {
    on<GetData>((event, emit) async {
      Dio dio = Dio(BaseOptions(responseType: ResponseType.plain));
      try {
        final res = await dio.get(
            event.urL);
       
        print(res.data);

        final data = getNewsDetailsFromJson(res.data);
        emit(ArticleBlocOndone(data));
      } catch (e) {
        print(e);
      }
    });
  }
}
