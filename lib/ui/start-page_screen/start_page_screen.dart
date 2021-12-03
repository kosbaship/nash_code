// import 'package:adahi_eidapp/screens/home_screens/home_screens.dart';
//
// import 'package:adahi_eidapp/screens/settings_screen/settings_screen.dart';
// import 'package:adahi_eidapp/screens/start-page_screen/dark_mode_screen.dart';
// import 'package:adahi_eidapp/screens/start-page_screen/language_screen.dart';
// import 'package:adahi_eidapp/screens/user_meat_shops/user_meat_shops.dart';
// import 'package:adahi_eidapp/screens/welcome_screen/welcome_screen.dart';
// import 'package:adahi_eidapp/shared/app_helper_methods.dart';
// import 'package:adahi_eidapp/shared/app_helper_widgets.dart';
// import 'package:adahi_eidapp/shared/app_strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nash_code/ui/shared/app_strings.dart';
import 'package:nash_code/ui/shared/helper_methods.dart';
import 'package:nash_code/ui/start-page_screen/dark_mode_screen.dart';
import 'package:nash_code/ui/start-page_screen/language_screen.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  var selectedCitiy, selectedAreas, areaItems;
  List<String> cities = <String>[
    "Amman",
    "Zarqa",
    "Irbid",
    "Al Karak",
    "Ma'an",
    "Al Aqabah",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.teal,
        title: Text('Adahi '),
      ),
      drawer: Drawer(
        child: ListView(children: [
          //header of drawer
          UserAccountsDrawerHeader(
            accountName: Text('your name '),
            accountEmail: Text(' email@gmail.com '),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          InkWell(
            // onTap: () {
            //   navigateTo(context, HomeScreens());
            // },
            child: ListTile(
              title: Text('Home Screens'),
              leading: Icon(
                Icons.home,
                color: Colors.teal,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('My account'),
              leading: Icon(
                Icons.account_box,
                color: Colors.teal,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              navigateTo(context, LanguageScreen());
            },
            child: ListTile(
              title: Text('Language'),
              leading: Icon(
                Icons.language,
                color: Colors.teal,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              navigateTo(context, DarkModeScreen());
            },
            child: ListTile(
              title: Text('DarkMode'),
              leading: Icon(
                Icons.invert_colors,
                color: Colors.teal,
              ),
            ),
          ),
          Divider(),
          // InkWell(
          //   onTap: () {
          //     navigateTo(context, WelcomeScreen());
          //   },
          //   child: ListTile(
          //     title: Text('Setting'),
          //     leading: Icon(
          //       Icons.settings,
          //       color: Colors.teal,
          //     ),
          //   ),
          // ),
          InkWell(
            // onTap: () {
            //   //signOut();
            //   navigateAndFinish(context, WelcomeScreen());
            // },
            child: ListTile(
              title: Text('Log out '),
              leading: Icon(
                Icons.logout,
                color: Colors.teal,
              ),
            ),
          ),
        ]),
      ),
      /////End the Drawer/////////
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              //color: const Color(0xff7c94b6),
              image: DecorationImage(
                image: AssetImage('assets/images/sheep3.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.6), BlendMode.lighten),

                // BlendMode.dstATop,),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(
                    bottom: 100.0, top: 100.0, left: 10.0, right: 10.0),
                child: Text(
                  "choose  your place",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.teal,
                  ),
                ),
              ),
              /////////////////////////////////
              Container(
                margin: EdgeInsets.only(left: 10.0, right: 10.0),
                padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25,
                  ),
                  border: Border.all(
                    color: Colors.teal,
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.teal,
                      spreadRadius: 2,
                      blurRadius: 2,
                    ),
                  ],
                ),
                // color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: DropdownButtonHideUnderline(
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton<String>(
                            dropdownColor: Colors.teal[400],
                            value: selectedCitiy,
                            iconSize: 30,
                            icon: (null),
                            //Icon(Icons.place),
                            //
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            hint: Text(
                              'Select City',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onChanged: (cities) {
                              setState(() {
                                selectedCitiy = cities;
                                // cities();
                                print('$cities');
                              });
                            },

                            isExpanded: false,
                            items: cities.map((item) {
                                  return new DropdownMenuItem(
                                    child: Text(
                                      item,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    value: item,
                                  );
                                })?.toList() ??
                                [],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 20.0,
              ),
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection(kAreaCollectionName)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      Text("loading .... ");
                    } else {
                      List<DropdownMenuItem> areaItems = [];
                      for (int i = 0; i < snapshot.data.docs.length; i++) {
                        DocumentSnapshot snap = snapshot.data.docs[i];
                        areaItems.add(
                          DropdownMenuItem(
                            child: Text(
                              snap[kAreaName],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),

                            value: "${snap.id.toString()}",

                            //  areaItems,"${snap.id}",
                          ),
                        );
                      }
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(null),
                          Container(
                            margin: EdgeInsets.only(left: 10.0, right: 10.0),
                            padding: EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                25,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.teal,
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                ),
                              ],
                              // border: Border.all(
                              //   color: Colors.teal,
                              //   width: 1,
                              // ),
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  DropdownButton(
                                    iconEnabledColor: Colors.white,
                                    dropdownColor: Colors.teal[400],
                                    items: areaItems,
                                    onChanged: (areaValue) {
                                      // setState(() {
                                      //   selectedAreas = areaValue;
                                      //   navigateTo(context, UserMeatShops());
                                      //   // UserMeatShops());
                                      // });
                                    },
                                    value: selectedAreas,
                                    //selectedAreas,
                                    isExpanded: false,
                                    hint: Text("Choose your area please!",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    return Container();
                  }),
            ],
          ),
        ],
      ),
      //////
      // body: ListView(
      //    children: [
      //      Padding(
      //        padding: const EdgeInsets.all(8.0),
      //        child: Text('Categories'),
      //      ),
      //      HorizontalList(),
      //    ],
      //  ),
    );
  }
}
