import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:launmax_app/styles.dart';
import 'package:launmax_app/ui/screens/signIn/res.dart';

class ProfilePage extends StatelessWidget {
  static Widget appBar() {
    return AppBar(
      elevation: 1,
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 18.0, top: 20),
          child: Text(
            'Edit Profile',
            style: TextStyle(
                fontWeight: FontWeight.w300, color: Color(0xff135A59)),
          ),
        )
      ],
      title: Text(
        'Profile',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Color(0xff151522),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                height: 79,
                width: 79,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(
                    'assets/images/avatarbig.png',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'John Doe',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/marker.svg',
                    height: 12,
                    width: 9,
                  ),
                  SizedBox(
                    width: 8.75,
                  ),
                  Text(
                    'Lagos',
                    style: TextStyle(
                        fontSize: McGyver.textSize(context, 2),
                        fontWeight: FontWeight.normal,
                        color: Color(0xff787676)),
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 32,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 39.0, right: 29),
          child: Text(
            'MORE',
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.normal,
                color: AppColor.text2),
          ),
        ),
        SizedBox(
          height: McGyver.rsDoubleH(context, 1.4),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 29.0, right: 29),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 5,
            child: Container(
              padding: const EdgeInsets.only(left: 0, right: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: SvgPicture.asset(
                          'assets/images/card.svg',
                          height: McGyver.rsDoubleH(context, 4),
                        ),
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: SvgPicture.asset(
                          'assets/images/arrow.svg',
                          height: McGyver.rsDoubleH(context, 2),
                        ),
                      ),
                      title: Text(
                        'Cards',
                        style: TextStyle(
                            fontSize: McGyver.textSize(context, 2.4),
                            fontWeight: FontWeight.normal,
                            color: Color(0xff999999)),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 1.0, color: Color(0xfffafafa)),
                      ),
                    ),
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: SvgPicture.asset(
                          'assets/images/refer.svg',
                          height: McGyver.rsDoubleH(context, 4),
                        ),
                      ),
                      title: Text(
                        'Refer a friend',
                        style: TextStyle(
                            fontSize: McGyver.textSize(context, 2.4),
                            fontWeight: FontWeight.normal,
                            color: Color(0xff999999)),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 1.0, color: Color(0xfffafafa)),
                      ),
                    ),
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: SvgPicture.asset(
                          'assets/images/chat.svg',
                          height: McGyver.rsDoubleH(context, 4),
                        ),
                      ),
                      title: Text(
                        'Chat with us',
                        style: TextStyle(
                            fontSize: McGyver.textSize(context, 2.4),
                            fontWeight: FontWeight.normal,
                            color: Color(0xff999999)),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 1.0, color: Color(0xfffafafa)),
                      ),
                    ),
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: SvgPicture.asset(
                          'assets/images/about.svg',
                          height: McGyver.rsDoubleH(context, 4),
                        ),
                      ),
                      title: Text(
                        'About us',
                        style: TextStyle(
                            fontSize: McGyver.textSize(context, 2.4),
                            fontWeight: FontWeight.normal,
                            color: Color(0xff999999)),
                      ),
                    ),
                  ),
                  Container(
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: SvgPicture.asset(
                          'assets/images/out.svg',
                          height: McGyver.rsDoubleH(context, 4),
                        ),
                      ),
                      title: Text(
                        'Sign out',
                        style: TextStyle(
                            fontSize: McGyver.textSize(context, 2.4),
                            fontWeight: FontWeight.normal,
                            color: Color(0xff999999)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
