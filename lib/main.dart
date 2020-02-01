import 'package:browse_shoes/ShoesModel.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  ListOfData listOfData = ListOfData();
  final DecorationTween _decorationTween = DecorationTween(
      begin: BoxDecoration(
          gradient: LinearGradient(
        colors: [Color(0xff6F00FE), Color(0xffF72648)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      end: BoxDecoration(
          gradient: LinearGradient(
        colors: [Color(0xff4054FF), Color(0xff00E8CA)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )));
  AnimationController decorationController;
  double width, height;

  ScrollController mScrollController;

  var decorationColor1 = [Color(0xff6F00FE), Color(0xffF72648)];
  var decorationColor2 = [Color(0xff4054FF), Color(0xff00E8CA)];
  var decorationColor3 = [Color(0xffFFBA00), Color(0xff40A1FF)];
  int selectedPage=0;
  @override
  void initState() {
    super.initState();
    mScrollController = ScrollController();
    decorationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    listOfData.addValue();
    mScrollController.addListener(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: AnimatedContainer(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: decorationColor1,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          duration: Duration(milliseconds: 500),
          child: PageView.builder(itemBuilder: (BuildContext context, int index) {
            return listItem(listOfData.listShoes[index], context);
          },itemCount: listOfData.listShoes.length,
            scrollDirection: Axis.vertical,
          ),
        ),
      ),
    );
  }

  listItem(ShoesModel mShoesModel, context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: RotatedBox(
              quarterTurns: 3,
              child: Transform.translate(
                offset: Offset(-60, 40),
                child: Container(
                  margin: EdgeInsets.only(right: 24),
                  child: Text(
                    "AIR",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 208),
                  ),
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 48,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Image.asset(
                      "assets/ic_nike_logo.png",
                    ),
                    margin: EdgeInsets.only(left: 24),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 4, right: 4),
                    margin: EdgeInsets.only(right: 24),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8))),
                    child: Text(
                      "\$" + mShoesModel.price,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Container(
                  margin: EdgeInsets.only(left: 24, top: 16),
                  child: Text(
                    mShoesModel.title,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
              Container(
                  margin: EdgeInsets.only(left: 24, top: 4),
                  child: Text(
                    mShoesModel.desc,
                    style: TextStyle(
                        color: Colors.white.withOpacity(.5), fontSize: 12),
                  ))
            ],
          ),
          Center(
            child: Container(
              alignment: Alignment.centerLeft,
              child: Image.asset(mShoesModel.imagePath),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding:
                        EdgeInsets.only(left: 36, right: 36, top: 8, bottom: 8),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: .5),
                        borderRadius: BorderRadius.all(Radius.circular(24))),
                    child: Text(
                      "WISH LIST",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    mShoesModel.wishlist,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  Icon(
                    Icons.keyboard_arrow_up,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 24,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
