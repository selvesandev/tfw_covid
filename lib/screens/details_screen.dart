import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tfw_covid/constants.dart';
import 'package:tfw_covid/widgets/weekly_chart.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 21),
                      blurRadius: 53,
                      color: Colors.black.withOpacity(0.05)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  buildTitleWithMoreIcon(),
                  SizedBox(height: 15),
                  buildCaseNumber(context),
                  Text(
                    "From Health Center",
                    style: TextStyle(
                        color: kTextMediumColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w200),
                  ),
                  SizedBox(height: 15),
                  WeeklyChart(),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      buildInfoTextWithPercent(
                        percentage: '6.43%',
                        title: 'From last week',
                      ),
                      buildInfoTextWithPercent(
                        percentage: '9.43%',
                        title: 'Recovery Rate',
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  RichText buildInfoTextWithPercent({String title, String percentage}) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: "$percentage\n",
          style: TextStyle(
            fontSize: 20,
            color: kPrimaryColor,
          ),
        ),
        TextSpan(
          text: "$title",
          style: TextStyle(
            fontSize: 12,
            color: kTextMediumColor,
            height: 1.5,
          ),
        )
      ]),
    );
  }

  Row buildCaseNumber(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          "547",
          style: Theme.of(context)
              .textTheme
              .display3
              .copyWith(color: kPrimaryColor, height: 1.2),
        ),
        Text(
          "5.9%",
          style: TextStyle(color: kPrimaryColor),
        ),
        SvgPicture.asset("assets/icons/increase.svg")
      ],
    );
  }

  Row buildTitleWithMoreIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "New Cases",
          style: TextStyle(
            color: kTextMediumColor,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
        SvgPicture.asset("assets/icons/more.svg")
      ],
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0,
      actions: <Widget>[
        IconButton(
            icon: SvgPicture.asset("assets/icons/search.svg"), onPressed: () {})
      ],
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
        color: kPrimaryColor,
      ),
    );
  }
}
