import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/core/sizedbox.dart';

import '../../controller/bloc/bloc/article_bloc_bloc.dart';
import '../../model/class_argument/arguments.dart';
import '../article_page/article_page.dart';

class BusinessPage extends StatefulWidget {
  const BusinessPage({Key? key}) : super(key: key);

  @override
  State<BusinessPage> createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage> {
  @override
  void initState() {
    context.read<ArticleBlocBloc>().add(GetData(
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=5573acba2646452c9cb8c8be392c669a"));
    super.initState();
  }

  final List<Widget> screen = const [];

  final String descr =
      "New York lawmakers have passed a bill that would temporarily ban new bitcoin mining operations. Early on Friday, state senators voted 36-27 to pass the legislation. It's now bound for the desk of Governor Kathy Hochul, who will sign it into law or veto th…";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleBlocBloc, ArticleBlocState>(
      builder: (context, state) {
       return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder<ArticleBlocBloc, ArticleBlocState>(
            builder: (context, state) {
          if (state is ArticleBlocOndone) {
            return ListView.separated(
                itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "details",arguments: ShareArgument(state.data,index));
                    },
                    child: NewsConatiner(
                      index: index,
                      descr: descr,
                      details: state.data.articles!,
                    )),
                separatorBuilder: (context, index) => Divider(),
                itemCount: 10);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }),
      ),
    );
      },
    );
  }
}

