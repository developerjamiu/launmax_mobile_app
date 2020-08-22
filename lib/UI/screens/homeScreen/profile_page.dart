import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:launmax_app/styles.dart';
import 'package:launmax_app/ui/screens/signIn/res.dart';
import 'package:launmax_app/ui/widgets/app_card.dart';

class ProfilePage extends StatelessWidget {
  static Widget appBar() {
    return AppBar(
      elevation: 1,
      centerTitle: true,
      actions: [
        Container(
          margin: EdgeInsets.only(right: 8.0),
          alignment: Alignment.center,
          child: FlatButton(
            padding: const EdgeInsets.all(8.0),
            onPressed: () {},
            child: Text(
              'Edit Profile',
              style: TextStyle(
                  fontWeight: FontWeight.w300, color: Color(0xff135A59)),
            ),
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
        SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.only(left: 39.0, right: 29),
          child: Text(
            'MORE',
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.normal,
                color: AppColor.text1),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 29, right: 29),
          child: AppCard(
            radius: 16.0,
            blurRadius: 16.0,
            color: Colors.white,
            child: Material(
              color: Colors.transparent,
              child: Column(
                children: [
                  _buildRow(
                    'assets/images/card.svg',
                    'Cards',
                    onTap: () {},
                    trailing: SvgPicture.asset(
                      'assets/images/arrow.svg',
                      height: 12,
                    ),
                  ),
                  Divider(color: AppColor.divider),
                  _buildRow(
                    'assets/images/refer.svg',
                    'Refer a friend',
                    onTap: () {},
                  ),
                  Divider(color: AppColor.divider),
                  _buildRow(
                    'assets/images/chat.svg',
                    'Chat with us',
                    onTap: () {},
                  ),
                  Divider(color: AppColor.divider),
                  _buildRow(
                    'assets/images/about.svg',
                    'About us',
                    onTap: () {},
                  ),
                  Divider(color: AppColor.divider),
                  _buildRow(
                    'assets/images/out.svg',
                    'Sign out',
                    onTap: () {},
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRow(String iconPath, String title,
      {Widget trailing, VoidCallback onTap}) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 11.0),
      leading: SvgPicture.asset(
        iconPath,
        height: 20,
      ),
      dense: true,
      trailing: trailing,
      onTap: onTap,
      title: Text(
        title,
        style: TextStyle(color: AppColor.text1),
        maxLines: 1,
      ),
    );
  }
}
