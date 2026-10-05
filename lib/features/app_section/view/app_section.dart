import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/core/Themes/colors_app.dart';
import 'package:shopping/features/app_section/view_model/app_section_cubit.dart';

class AppSection extends StatelessWidget {
  const AppSection({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> Page = [
      Center(child: Text("Home")),
      Center(child: Text("Cart")),
      Center(child: Text("Favourite")),
      Center(child: Text("Account")),
    ];
    int index = 0;
    return BlocProvider(
      create: (context) => BottomNavCubitCubit()..intent(GetIndx(index)),
      child: BlocBuilder<BottomNavCubitCubit, BottomNavCubitState>(
        builder: (context, state) {
          if (state is HomeState) {
            index = 0;
          } else if (state is CartState) {
            index = 1;
          } else if (state is FavouriteState) {
            index = 2;
          } else {
            index = 3;
          }

          return Scaffold(
            body: Page[index],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: index,
              onTap: (value) {
                context.read<BottomNavCubitCubit>().intent(GetIndx(value));
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: ColorsApp.backgroundColor,
              selectedItemColor: Colors.orange,
              unselectedItemColor: const Color(0xff5C5C5C),
              selectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              showSelectedLabels: true,
              showUnselectedLabels: true,
              elevation: 8,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.house, size: 32),
                  activeIcon: Icon(CupertinoIcons.house_fill, size: 32),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.cart, size: 32),
                  activeIcon: Icon(CupertinoIcons.cart_fill, size: 32),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.heart, size: 32),
                  activeIcon: Icon(CupertinoIcons.heart_fill, size: 32),
                  label: 'Favourite',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person, size: 32),
                  activeIcon: Icon(CupertinoIcons.person_fill, size: 32),
                  label: 'Account',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
