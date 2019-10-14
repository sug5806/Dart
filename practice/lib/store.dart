import 'package:flutter/material.dart';
import 'package:practice/components/card_components.dart';
import 'package:practice/components/text_components.dart';
import 'package:practice/components/button_components.dart';
import 'package:practice/components/bottom_naviation_components.dart';

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
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MyText(str: '판매', size: 30.0),
                  GestureDetector(
                    child: CircleAvatar(
                      radius: 15.0,
                      backgroundImage: NetworkImage(
                        'http://image.dongascience.com/Photo/2018/12/2d5efe44bdd02f3e2ec4e99189d89d18.jpg',
                      ),
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
                child: ListView(
                  children: <Widget>[
                    MyCardComponent(
                      url:
                          'http://cf.joara.com/literature_file/20190427_235346.jpg_thumb.png',
                      storeName: 'CAFE24',
                      category: '독립몰',
                    ),
                    MyCardComponent(
                      url:
                          'https://cdn.imweb.me/upload/S201807025b39d1981b0b0/5cad8fb10687d.jpg',
                      storeName: '셀러허브',
                      category: '독립몰',
                    ),
                    MyCardComponent(
                      url:
                          'https://write.dcinside.com/viewimage.php?id=fromsoftware&no=24b0d769e1d32ca73fef85fa11d02831beed24700845ca5273c6c35de56bd4c7fa8a2895f889a18768d182c2126d77bc97cb6aec748183ad6b362f702e41a643e593bc1b97f8',
                      storeName: 'LAZADA Malaysia',
                      category: '오픈마켓',
                    ),
                    MyCardComponent(
                      url:
                          'http://file.thisisgame.com/upload/tboard/user/2014/01/10/20140110014908_2620.jpeg',
                      storeName: 'Shopify',
                      category: '독립몰',
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: MyText(str: '일반 스토어', size: 14.0, bold: true),
              ),
//              Expanded(
//                child: ListView(
//                  children: <Widget>[
//
//                  ],
//                ),
//              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBTNAV(),
    );
  }
}
