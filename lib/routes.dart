import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/controller/bloc/bloc/article_bloc_bloc.dart';
import 'package:newsapp/controller/cubit/bottomnavcubit/bottom_nav_cubit.dart';
import 'package:newsapp/model/class_argument/arguments.dart';
import 'package:newsapp/view/article_page/article_page.dart';
import 'package:newsapp/view/bottom_nav/bottomnav.dart';
import 'package:newsapp/view/details_screen/details_screen.dart';

class AppRoutes {
  Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => ArticleBlocBloc()),
              BlocProvider(create: (context) => BottomNavCubit()),
            ],
            child: const BottomNav(),
          ),
        );
      case "details":
        final args = settings.arguments as ShareArgument;
        return MaterialPageRoute(
          builder: (context) =>  DetailsScreen(details: args.data,index: args.index),
        );

      default:
        return MaterialPageRoute(builder: (context) => const ArticlePage());
    }
  }
}
