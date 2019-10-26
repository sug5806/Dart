import 'package:flutter/material.dart';
import 'package:project/common/widget/card_components.dart';
import 'package:project/common/widget/dialog_components.dart';
import 'package:project/common/widget/text_components.dart';
import 'package:project/common/widget/button_components.dart';
import 'package:project/common/widget/bottom_naviation_components.dart';
import 'package:project/common/widget/circle_image.dart';

class Store extends StatefulWidget {
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    MyText(str: '판매', size: 30.0),
                    MyImageButton(
                      onPressed: () {
                        setState(() {
                          dialog(context);
                        });
                      },
                      child: MyCircleAvatar(
                        image:
                            'http://image.dongascience.com/Photo/2018/12/2d5efe44bdd02f3e2ec4e99189d89d18.jpg',
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(child: MyText(str: '홈', size: 18.0)),
                    GestureDetector(child: MyText(str: '스토어', size: 18.0)),
                    GestureDetector(child: MyText(str: '셀러 가이드', size: 18.0)),
                    GestureDetector(child: MyText(str: '프로모션', size: 18.0)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CategoryButtonComponent(str: '전체'),
                    CategoryButtonComponent(str: '독립몰'),
                    CategoryButtonComponent(str: '전문몰'),
                    CategoryButtonComponent(str: '종합몰'),
                    CategoryButtonComponent(str: '오픈마켓'),
                  ],
                ),
                SizedBox(
                  height: 16.0,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: MyText(str: '연동 가능 스토어', size: 14.0, bold: true),
                ),
                Expanded(
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: false,
                    scrollDirection: Axis.vertical,
                    itemCount: ret_card_list().length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: ret_card_list()[index],
                      );
                    },
                  ),
                ),
//              Container(
//                alignment: Alignment.topLeft,
//                child: MyText(str: '일반 스토어', size: 14.0, bold: true),
//              ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: MyBTNAV(),
    );
  }
}
