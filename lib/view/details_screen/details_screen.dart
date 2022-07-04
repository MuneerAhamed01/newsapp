import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/core/sizedbox.dart';
import 'package:newsapp/model/data_model/data_model.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.details, required this.index})
      : super(key: key);
  final GetNewsDetails details;
  final int index;
  final String descr =
      "New York lawmakers have passed a bill that would temporarily ban new bitcoin mining operations. Early on Friday, state senators voted 36-27 to pass the legislation. It's now bound for the desk of Governor Kathy Hochul, who will sign it into law or veto th…";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 250.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                        image:
                            NetworkImage(details.articles![index].urlToImage!),
                        fit: BoxFit.cover)),
              ),
              h20,
              Text(
                "Turkey's annual inflation soars to almost 79% - CNBC",
                style: GoogleFonts.roboto(
                    fontSize: 30.sp, fontWeight: FontWeight.bold),
              ),
              h20,
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "-- Kris Holt",
                  style: GoogleFonts.lato(),
                ),
              ),
              h20,
              Text(
                "${details.articles![0].description!}",
                style: GoogleFonts.rubik(letterSpacing: 1),
              ),
              h10,
              Text(details.articles![0].content!),
              h20,
              Container(
                  height: 180.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 1,
                            spreadRadius: 1)
                      ]),
                  child: Padding(
                    padding: EdgeInsets.all(15.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("author : ${details.articles![0].author}"),
                        h10,
                        Text(
                            "publishedAt :  ${details.articles![0].publishedAt}"),
                        h10,
                        Text(
                            "Company : ${details.articles![index].source!.id}"),
                        h10,
                        Text("Read Full : ${details.articles![index].url}"),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    ));
  }
}
