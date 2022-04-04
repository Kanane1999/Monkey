import 'package:flutter/material.dart';
import 'package:monkey/screens/app/home/home.dart';
import 'package:monkey/screens/app/menu/menu.dart';

class App extends StatefulWidget {
  static String routeName = "/home_app";
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin {
  String selectMenu = "Home";
  Color color = const Color(0xFFebebeb);
  bool hasScrolled = false;

  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(initialIndex: 2, length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                const MenuApp(),
                Container(),
                const Home(),
                Container(),
                Container(),
              ],
            ),
            Align(alignment: Alignment.bottomCenter, child: bottomNavigation()),
          ],
        ),
      ),
    );
  }

  Widget bottomNavigation() {
    return SizedBox(
      height: 165,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 75),
            padding:
                const EdgeInsets.only(top: 30, left: 15, bottom: 15, right: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey.withOpacity(.15),
                  offset: const Offset(-1, -5),
                  blurRadius: 5,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                modelIcon(
                  icon: Icons.grid_view,
                  menu: "Produits",
                  index: 0,
                ),
                modelIcon(
                  icon: Icons.favorite,
                  menu: "Favorie",
                  index: 1,
                ),
                const SizedBox(
                  width: 100,
                ),
                modelIcon(
                  icon: Icons.shopping_cart_rounded,
                  menu: "Panier",
                  index: 3,
                ),
                modelIcon(icon: Icons.person, menu: "Profil", index: 4),
              ],
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 2 - 50,
            top: 20,
            child: customHomeButton(),
          ),
        ],
      ),
    );
  }

  modelIcon({
    IconData? icon,
    String? menu,
    required index,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          selectMenu = menu!;
          _tabController!.animateTo(index);
        });
      },
      borderRadius: BorderRadius.circular(30),
      child: Column(
        children: [
          Icon(
            icon,
            color: menu == selectMenu
                ? Theme.of(context).primaryColor
                : Colors.grey.withOpacity(.5),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              "$menu",
              style: TextStyle(
                color: menu == selectMenu
                    ? Theme.of(context).primaryColor
                    : Colors.grey.withOpacity(.5),
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  customHomeButton() {
    return InkWell(
      onTap: () {
        setState(() {
          selectMenu = "Home";
          _tabController!.animateTo(2);
        });
      },
      borderRadius: BorderRadius.circular(80),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor.withOpacity(.7),
          shape: BoxShape.circle,
        ),
        child: AnimatedContainer(
          duration: const Duration(
            seconds: 1,
          ),
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 8,
            ),
            color: selectMenu == "Home"
                ? Theme.of(context).primaryColor
                : Colors.grey.withOpacity(.5),
            shape: BoxShape.circle,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(
                  .5,
                ),
                offset: const Offset(1, 5),
                blurRadius: 5,
              ),
              BoxShadow(
                color: Colors.grey.withOpacity(.15),
                offset: const Offset(-1, -5),
                blurRadius: 5,
              ),
            ],
          ),
          child: const Icon(
            Icons.home,
            size: 35,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
