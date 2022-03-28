import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:sara_music/Screens/Booking.dart';
import 'package:sara_music/Screens/Category.dart';
import 'package:sara_music/Screens/Details_screen.dart';
import 'package:sara_music/Screens/MyDrawer.dart';
import 'package:sara_music/Screens/Shop.dart';
import 'package:sara_music/Screens/Profile.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';

class Homepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomepageState();
  }
}

class HomepageState extends State<Homepage> {
  List teacher = [
    "Ehab Sarrawi",
    "Mahmoud Saddouq",
    "Ahmad Sadouq",
    "Khaled Saddouq",
    "Mohammod Saddouq",
  ];
  ScrollController _scrollController = ScrollController();
  bool _verticalList = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: Padding(
        padding: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Image.asset(
                    'images/icons-menu.png',
                    height: 30,
                  ),
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
                AdvancedAvatar(
                  size: 50,
                  image: AssetImage('images/Logo.png'),
                  foregroundDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text("Hi Ehab,",
                style: GoogleFonts.sansita(
                    fontSize: 32, fontWeight: FontWeight.w600)),
            Text(
              "Find a course you want to learn",
              style: GoogleFonts.sansita(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Teachers",
                    style: GoogleFonts.sansita(
                        fontSize: 20, fontWeight: FontWeight.w600)),
                InkWell(
                  child: Text("See all",
                      style: GoogleFonts.sansita(
                          fontSize: 18, color: Colors.blue)),
                  onTap: () {
                    Navigator.of(context).pushNamed("Categories");
                  },
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 199,
              child: ListView.separated(
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 24),
                itemCount: teacher.length,
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(indent: 16),
                itemBuilder: (BuildContext context, int index) => Container(
                  width: 283,
                  height: 199,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 231, 241, 241),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 77,
                          height: 54,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 0, 84, 153),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(32)),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 100,
                        left: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${teacher[index]}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              categories[index].name,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(                             
                            children: [
                              SizedBox(width: 2.5,),
                              Text(
                                "4.5",
                                style: GoogleFonts.sansita(
                                    color: Color.fromARGB(255, 58, 57, 57)),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              SmoothStarRating(
                                size: 20,
                                rating: 5,
                                defaultIconData: Icons.star,
                                starCount: 1,
                                color: Colors.yellow,
                                borderColor: Colors.yellow,
                              ),
                              
                              
                            ],
                          ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          width: 77,
                          height: 54,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 0, 84, 153),
                            borderRadius:
                                BorderRadius.only(topLeft: Radius.circular(32)),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 10,
                        bottom: 80,
                        top: 0,
                        child: SizedBox(
                          width: 100,
                          height: 140,
                          child: Hero(
                            tag: "${teacher[index]}",
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 80,
                              child: CircleAvatar(
                                radius: 48,
                                backgroundImage: AssetImage('images/ehab.jpg'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Categories",
                    style: GoogleFonts.sansita(
                        fontSize: 20, fontWeight: FontWeight.w600)),
                InkWell(
                  child: Text("See all",
                      style: GoogleFonts.sansita(
                          fontSize: 18, color: Colors.blue)),
                  onTap: () {
                    Navigator.of(context).pushNamed("Categories");
                  },
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: StaggeredGridView.countBuilder(
                padding: EdgeInsets.all(0),
                crossAxisCount: 2,
                itemCount: 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      if (categories[index].name == "Guitar") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Details_Screen()));
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: index.isEven ? 250 : 280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage(categories[index].image),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            categories[index].name,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              height: 1,
                            ),
                          ),
                          Text(
                            '${categories[index].numOfCourses} Courses',
                            style: TextStyle(
                              color: Color(0xFF0D1333).withOpacity(.5),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
