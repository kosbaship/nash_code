// import 'package:adahi_eidapp/screens/admin_meat_shops/admin_meat_shops.dart';
// import 'package:adahi_eidapp/screens/start-page_screen/navigationdrawerwidget.dart';
// import 'package:adahi_eidapp/screens/start-page_screen/navigationprovider.dart';
// import 'package:adahi_eidapp/shared/app_helper_methods.dart';
// import 'package:adahi_eidapp/shared/app_strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nash_code/ui/shared/app_strings.dart';
import 'package:nash_code/ui/shared/helper_methods.dart';
import 'package:nash_code/ui/start-page_screen/navigationdrawerwidget.dart';
import 'package:nash_code/ui/start-page_screen/navigationprovider.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatelessWidget {
  static final String title = 'choose your place!';
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => NavigationProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(primarySwatch: Colors.teal),
          home: MainPage(),
        ),
      );
}

////////////////////
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var selectedCitiy, selectedAreas, areaItems;
  List<String> cities = <String>[
    "Amman",
    "Zarqa",
    "Irbid",
    "Al Karak",
    "Ma'an",
    "Al Aqabah",
  ];
  var myCity;
  var myArea;
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text(FirstPage.title),
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xff7c94b6),
                image: DecorationImage(
                  image: AssetImage('assets/images/sheep3.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.5), BlendMode.dstATop),
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
                    style:
                        TextStyle(fontWeight: FontWeight.w800, fontSize: 20.0),
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
                                color: Colors.black54,
                                fontSize: 16,
                              ),
                              hint: Text(
                                'select City',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
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
                                            color: Colors.black87,
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
                                    color: Colors.black87,
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
                                    color: Colors.grey.withOpacity(0.2),
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
                                      dropdownColor: Colors.teal[400],
                                      items: areaItems,
                                      // Text(item['title']),
                                      //areaItems,
                                      onChanged: (areaValue) {
                                        // setState(() {
                                        //   selectedAreas = areaValue;
                                        //
                                        //   navigateTo(context, AdminMeatShops());
                                        // });
                                      },
                                      value: selectedAreas,
                                      //selectedAreas,
                                      isExpanded: false,
                                      hint: Text("choose your place please!"),
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
      );
}

//<QuerySnapshot>
