import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tfw_covid/constants.dart';
import 'package:tfw_covid/screens/details_screen.dart';
import 'package:tfw_covid/widgets/info_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 340,
                padding:
                    EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 40),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(.03),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Wrap(
                  runSpacing: 20,
                  spacing: 20,
                  children: <Widget>[
                    InfoCard(
                      title: "Confirmed Cases",
                      iconColor: Color(0xFFFF8C00),
                      effectNum: 1062,
                      press: () {},
                    ),
                    InfoCard(
                      title: "Total Deaths",
                      iconColor: Color(0xFFFF2D55),
                      effectNum: 23,
                      press: () {},
                    ),
                    InfoCard(
                      title: "Total Recovered",
                      iconColor: Color(0xFF50E3C2),
                      effectNum: 62,
                      press: () {},
                    ),
                    InfoCard(
                      title: "New Cases",
                      iconColor: Color(0xFF5856D6),
                      effectNum: 12,
                      press: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DetailsScreen();
                        }));
                      },
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Preventions",
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    buildPrevention(),
                    SizedBox(height: 40),
                    buildHelpCard(context)
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Row buildPrevention() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        PreventionCard(
          title: "Wash Hands",
          svgSrc: "assets/icons/hand_wash.svg",
        ),
        PreventionCard(
          title: "Use Mask",
          svgSrc: "assets/icons/use_mask.svg",
        ),
        PreventionCard(
          title: "Clean Disinfect",
          svgSrc: "assets/icons/Clean_Disinfect.svg",
        )
      ],
    );
  }

  Container buildHelpCard(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              //left side padding is 40% of total width
              left: MediaQuery.of(context).size.width * .4,
              top: 20,
              right: 20,
            ),
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF60BE93),
                    Color(0xFF188D59),
                  ],
                ),
                borderRadius: BorderRadius.circular(20)),
            child: RichText(
                text: TextSpan(
              children: [
                TextSpan(
                    text: "Dial 999 for \nMedical Help!\n",
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(color: Colors.white)),
                TextSpan(
                  text: "If any symptoms appear",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                  ),
                )
              ],
            )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SvgPicture.asset("assets/icons/nurse.svg"),
          ),
          Positioned(
            top: 30,
            right: 10,
            child: SvgPicture.asset("assets/icons/virus.svg"),
          )
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor.withOpacity(.03),
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: () {},
        ),
      ],
    );
  }
}

class PreventionCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  const PreventionCard({
    Key key,
    this.svgSrc,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SvgPicture.asset(svgSrc),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyText2
              .copyWith(color: kPrimaryColor),
        )
      ],
    );
  }
}
