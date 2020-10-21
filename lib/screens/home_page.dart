import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_app12/constants.dart';
import 'package:flutter_app12/screens/details_screen.dart';
import 'package:flutter_app12/widgets/bottom_nav_bar.dart';
import 'package:flutter_app12/widgets/category_card.dart';
import 'package:flutter_app12/widgets/search_bar.dart';


class ContentPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'devtrons',
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size;
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(

            height: size.height * .40,
            decoration: BoxDecoration(
              color: Color(0xFFEA80FC),
              image: DecorationImage(

                alignment: Alignment.centerLeft,
                image: AssetImage("assets/images/00.png"),

              ),

            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset("assets/icons/987.svg"),
                    ),
                  ),
                  Text(

                    "",

                    style: Theme.of(context)
                        .textTheme
                        .display1
                        .copyWith(fontWeight: FontWeight.w900),
                    textAlign: TextAlign.center,


                  ),
                  SearchBar(),
                  Expanded(

                    child: GridView.count(

                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 15,
                      children: <Widget>[


                        CategoryCard(
                          title: "chapter 1",
                          svgSrc: "assets/icons/9.svg",
                          press: () { Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return DetailsScreen();
                            }),
                          );},
                        ),
                        CategoryCard(
                          title: "chapter 2",
                          svgSrc: "assets/icons/9.svg",
                          press: () { Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return DetailsScreen();
                            }),
                          );},
                        ),
                        CategoryCard(
                          title: "chapter 3",
                          svgSrc: "assets/icons/9.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return DetailsScreen();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "chapter 4",
                          svgSrc: "assets/icons/9.svg",
                          press: () { Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return DetailsScreen();
                            }),
                          );},
                        ),
                        CategoryCard(
                          title: "chapter 4",
                          svgSrc: "assets/icons/9.svg",
                          press: () { Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return DetailsScreen();
                            }),
                          );},
                        ),
                        CategoryCard(
                          title: "chapter 4",
                          svgSrc: "assets/icons/9.svg",
                          press: () { Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return DetailsScreen();
                            }),
                          );},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
