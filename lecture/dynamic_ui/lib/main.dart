import 'package:flutter/material.dart';

void main() => runApp(myApp());


List<String> api_cate = [
	"카테고리 예시 1-1",
	"카테고리 예시 2-1",
	"카테고리 예시 3-1",
	"카테고리 예시 4-1",
	"카테고리 예시 5-1",
	"카테고리 예시 6-1",
	"카테고리 예시 7-1",
	"카테고리 예시 8-1",
	"카테고리 예시 9-1",
	"카테고리 예시 10-1",
	"카테고리 예시 11-1",
];

class Screen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Container(
			child: new Column(
				children: <Widget>[
					new GestureDetector(
						onTap: () {
							print('탭탭');
							showDialog(
								context: context,
								builder: (BuildContext context) =>
								new Dialog(
									shape: new RoundedRectangleBorder(
										borderRadius: new BorderRadius.circular(15.0)),
									child: new Column(
										children: <Widget>[
											new Container(
												alignment: Alignment.center,
												width: double.maxFinite,
												padding: new EdgeInsets.all(12.0),
												child: new Text('다이얼로그창'),
												decoration: new BoxDecoration(
													border: new Border(
														bottom: new BorderSide(
															color: Colors.grey,
															width: 0.5,
														),
													),
												),
											),
											new Expanded(
												child: new ListView.builder(
													itemCount: api_cate.length,
													itemBuilder: (BuildContext context, int index) {
														return new Container(
															padding: new EdgeInsets.symmetric(
																horizontal: 20.0, vertical: 10.0),
															child: new GestureDetector(
																child: new Text('${api_cate[index]}'),
																onTap: () {
																	Navigator.of(context).pop();
																},
															),
														);
													},
												),
											),
										],
									),
								),
							);
						},
						child: new Center(
						  child: new Container(
						  	padding: new EdgeInsets.symmetric(
						  		horizontal: 16.0, vertical: 10.0),
						  	width: 500.0,
						  	height: 50.0,
						  	decoration: new BoxDecoration(
						  		borderRadius: new BorderRadius.circular(5.0),
						  		border: new Border.all(
						  			color: Colors.grey,
						  			width: 0.3,
						  		),
						  	),
						  	child: new Row(
						  		mainAxisAlignment: MainAxisAlignment.spaceBetween,
						  		children: <Widget>[
						  			new Text('선택해주세요'),
						  		],
						  	),
						  ),
						),
					)
				],
			)
		);
	}
}


class myApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			home: new Scaffold(
				body: new Screen(),
			),
		);
	}
}
