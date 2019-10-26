import 'package:flutter/material.dart';
import 'package:practice/components/text_components.dart';

class MyCardComponent extends StatelessWidget {
  MyCardComponent({this.url, this.storeName, this.category});

  final String url;
  final String storeName;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          children: <Widget>[
            Image.network(
              url,
              fit: BoxFit.fill,
              width: 130.0,
              height: 90.0,
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          MyText(
                            str: storeName,
                            size: 14.0,
                            bold: true,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            padding:
                                EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromRGBO(130, 130, 130, 1.0)),
                            ),
                            child: Text(
                              category,
                              style: TextStyle(
                                  fontSize: 11.0,
                                  color: Color.fromRGBO(130, 130, 130, 1.0)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Image.network(
                            'https://icon-library.net/images/connect-icon-png/connect-icon-png-1.jpg',
                            width: 16.0,
                            height: 16.0,
                          ),
                          Text(
                            "미연동",
                            style:
                                TextStyle(color: Color.fromRGBO(130, 130, 130, 1.0)),
                          ),
                        ],
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

List<MyCardComponent> ret_card_list(){
  return [
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
    MyCardComponent(
      url:
      'http://file.thisisgame.com/upload/tboard/user/2014/01/10/20140110014908_2620.jpeg',
      storeName: 'Shopify',
      category: '독립몰',
    ),
  ];
}