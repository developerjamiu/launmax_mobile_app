import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:launmax_app/UI/screens/signIn/res.dart';

final user = "John";

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0, top: 20),
            child: Text(
              'Edit Profile',
              style: TextStyle(
                  fontSize: McGyver.textSize(context, 2.2),
                  fontWeight: FontWeight.w300,
                  color: Color(0xff135A59)),
            ),
          )
        ],
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 93.0),
            child: Text(
              'Profile',
              style: TextStyle(
                  fontSize: McGyver.textSize(context, 2.8),
                  fontWeight: FontWeight.w600,
                  color: Color(0xff151522)),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: McGyver.rsDoubleH(context, 3),
                ),
                
                Container(
                  height: McGyver.rsDoubleH(context, 12),
                  width: McGyver.rsDoubleW(context, 21),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(
                      'assets/images/avatarbig.png',
                    ),
                  ),
                ),
                SizedBox(
                  height: McGyver.rsDoubleH(context, 2),
                ),
                Text(
                  'John Doe',
                  style: TextStyle(
                      fontSize: McGyver.textSize(context, 2.7),
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                SizedBox(
                  height: McGyver.rsDoubleH(context, 2),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/marker.svg', 
                       height: McGyver.rsDoubleH(context, 2.1),),
                    SizedBox(
                      width: McGyver.rsDoubleW(context, 1.8),
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
            height: McGyver.rsDoubleH(context, 2.4),
          ),
         
          Padding(
            padding: const EdgeInsets.only(left: 39.0, right: 29),
            child: Row(
              children: [
                Text(
                  'MORE',
                  style: TextStyle(
                      fontSize: McGyver.textSize(context, 2.0),
                      fontWeight: FontWeight.normal,
                      color: Color(0xff787676)),
                )
              ],
            ),
          ),
          SizedBox(
            height: McGyver.rsDoubleH(context, 1.4),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 29.0, right: 29),
            child: Card(
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 5,
              child: Container(
                padding: const EdgeInsets.only(left: 0, right: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        
                      ),
                      child: ListTile(
                        leading:  Padding(

                          padding: const EdgeInsets.only(left:2.0),
                          child: SvgPicture.asset(
                                    'assets/images/card.svg',
                                    height: McGyver.rsDoubleH(context, 4),
                                  ),
                        ),
                        trailing: Padding(
                         padding: const EdgeInsets.only(left:4.0),
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
                        leading:  Padding(
                      padding: const EdgeInsets.only(left:2.0),                          child: SvgPicture.asset(
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
                        leading:  Padding(
                    padding: const EdgeInsets.only(left:2.0),                          child: SvgPicture.asset(
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
                        leading:  Padding(
                      padding: const EdgeInsets.only(left:2.0),                          child: SvgPicture.asset(
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
                        leading:  Padding(
                    padding: const EdgeInsets.only(left:2.0),  
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
      ),
    );
  }
}

