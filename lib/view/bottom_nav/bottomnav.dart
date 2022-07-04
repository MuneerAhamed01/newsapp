import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/controller/cubit/bottomnavcubit/bottom_nav_cubit.dart';
import 'package:newsapp/view/article_page/article_page.dart';
import 'package:newsapp/view/business_page/business_page.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final List<Widget> list = [ArticlePage(), BusinessPage()];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        state as BottomnavigationChanging;
        return Scaffold(
          body: list[state.index],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  backgroundColor: Color.fromARGB(255, 2, 1, 1),
                  icon: Icon(
                    Icons.article,
                    size: 30,
                  ),
                  label: "label"),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.business,
                  size: 30,
                ),
                label: "Home",
                backgroundColor: Colors.white,
              ),
            ],
            showSelectedLabels: false,
            showUnselectedLabels: false,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.white,
            currentIndex: state.index,
            onTap: (index) {
              context.read<BottomNavCubit>().onChangingIndex(index);
            },
          ),
        );
      },
    );
  }
}
