import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static String routeName = "/home_app";
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectMenu = "Home";

  ScrollController? _scrollController;
  bool hasScrolled = false;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          hasScrolled = _scrollController!.position.pixels >= 190;
        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        customAppBar(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 5,
                              width: 80,
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(.15),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            Row(
                              children: const [
                                Text(
                                  "Current location",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Icon(Icons.arrow_drop_down_sharp),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        searchBar(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 130,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 7,
                      itemBuilder: (context, index) => model1(),
                    ),
                  ),
                  bigTitle(
                    title: "Popular restaurents",
                  ),
                  Column(
                    children: List.generate(
                      3,
                      (index) => model2(),
                    ),
                  ),
                  bigTitle(
                    title: "Most Popular",
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) => model3(),
                    ),
                  ),
                  bigTitle(
                    title: "Recent Items",
                  ),
                  Column(
                    children: List.generate(
                      7,
                      (index) => model4(),
                    ),
                  ),
                ],
              ),
            ),
            AnimatedPositioned(
              top: hasScrolled ? 0 : -100,
              child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .scaffoldBackgroundColor
                        .withOpacity(.7),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  padding: const EdgeInsets.all(15),
                  child: searchBar()),
              duration: const Duration(
                seconds: 1,
              ),
            ),
            Align(alignment: Alignment.bottomCenter, child: bottomNavigation()),
          ],
        ),
      ),
    );
  }

  Widget searchBar() {
    return Container(
      width: MediaQuery.of(context).size.width - 30,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFebebeb),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(children: const [
        Icon(Icons.search),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            "Seach your meal",
            style: TextStyle(),
          ),
        ),
      ]),
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
                ),
                modelIcon(
                  icon: Icons.favorite,
                  menu: "Favorie",
                ),
                const SizedBox(
                  width: 100,
                ),
                modelIcon(
                  icon: Icons.shopping_cart_rounded,
                  menu: "Panier",
                ),
                modelIcon(
                  icon: Icons.person,
                  menu: "Profil",
                ),
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

  customHomeButton() {
    return InkWell(
      onTap: () {
        setState(() {
          selectMenu = "Home";
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

  modelIcon({
    IconData? icon,
    String? menu,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          selectMenu = menu!;
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

  customAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          Row(
            children: const [
              Expanded(
                child: Text(
                  "Good morning Daniel!",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Icon(
                Icons.shopping_cart_rounded,
              )
            ],
          ),
        ],
      ),
    );
  }

  bigTitle({
    String? title,
    Function()? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 20, left: 15, right: 15),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "$title",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            "Voir plus",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  model1() {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage("assets/images/meal.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text("Meal"),
        ],
      ),
    );
  }

  Widget model2() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/meal.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Foufou meal",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 18,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "3.5",
                          style: TextStyle(
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Lorem ipsum",
                      style: TextStyle(
                        color: Colors.black45,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Lorem ipsum",
                      style: TextStyle(
                        color: Colors.black45,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  model3() {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        children: [
          Column(
            children: [
              Container(
                width: 280,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/meal.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Foufou meal",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.star,
                          color: Colors.orangeAccent,
                          size: 18,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "3.5",
                          style: TextStyle(
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Lorem ipsum",
                      style: TextStyle(
                        color: Colors.black45,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Lorem ipsum",
                      style: TextStyle(
                        color: Colors.black45,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget model4() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 15,
        left: 15,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage("assets/images/meal.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Foufou meal",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  width: 10,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Lorem ipsum",
                  style: TextStyle(
                    color: Colors.black45,
                  ),
                ),
                SizedBox(
                  child: Row(
                    children: const [
                      Icon(
                        Icons.star,
                        color: Colors.orangeAccent,
                        size: 18,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "3.5",
                        style: TextStyle(
                          color: Colors.black45,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Lorem ipsum",
                        style: TextStyle(
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
