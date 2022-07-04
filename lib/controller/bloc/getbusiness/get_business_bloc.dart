import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'get_business_event.dart';
part 'get_business_state.dart';

class GetBusinessBloc extends Bloc<GetBusinessEvent, GetBusinessState> {
  GetBusinessBloc() : super(GetBusinessInitial()) {
    on<GetDetails>((event, emit) async {
      Dio dio = Dio(BaseOptions(responseType: ResponseType.plain));
      try {
        final response = await dio.get(
            "https://newsapi.org/v2/everything?q=bitcoin&apiKey=5573acba2646452c9cb8c8be392c669a");
      } catch (e) {
        print(e.toString());
      }
    });
  }
}
