import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/controller/bloc/bloc/article_bloc_bloc.dart';
import 'package:newsapp/core/sizedbox.dart';
import 'package:newsapp/model/class_argument/arguments.dart';
import 'package:newsapp/model/data_model/data_model.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<ArticleBlocBloc>().add(GetData("https://newsapi.org/v2/everything?q=bitcoin&apiKey=5573acba2646452c9cb8c8be392c669a"));
    super.initState();
  }

  final List<Widget> screen = const [];

  final String descr =
      "New York lawmakers have passed a bill that would temporarily ban new bitcoin mining operations. Early on Friday, state senators voted 36-27 to pass the legislation. It's now bound for the desk of Governor Kathy Hochul, who will sign it into law or veto th…";

  @override
  Widget build(BuildContext context) {
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
  }
}

class NewsConatiner extends StatelessWidget {
  const NewsConatiner({
    Key? key,
    required this.descr,
    required this.details,
    required this.index,
  }) : super(key: key);
  final List<Article> details;

  final int index;
  final String descr;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: 320.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 1,
                  spreadRadius: 1)
            ]),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Text(
                details[index].title!,
                style: GoogleFonts.roboto(
                    fontSize: 30.sp, fontWeight: FontWeight.bold),
              ),
              h10,
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  details[index].author!,
                  style: GoogleFonts.lato(),
                ),
              ),
              h20,
              LimitedBox(
                child: Text(
                  details[index].description!,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.rubik(letterSpacing: 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
