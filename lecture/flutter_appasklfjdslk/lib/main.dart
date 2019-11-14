import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
	// This widget is the root of your application.
	@override
	Widget build(BuildContext context) {
		print("재빌드?");
		return MaterialApp(
			title: 'Flutter Demo',
			theme: ThemeData(
				primarySwatch: Colors.blue,
			),
			home: MyHomePage(title: 'Flutter Demo Home Page'),
			routes: {
				'/asdf' : (BuildContext context) => asdf(),
				'/asdf2' : (BuildContext context) => asdf2(),
			}
		);
	}
}

class MyHomePage extends StatefulWidget {
	MyHomePage({Key key, this.title}) : super(key: key);

	final String title;

	@override
	_MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

	@override
	Widget build(BuildContext context) {
		print('재빌드');
		return Scaffold(
			appBar: AppBar(
				title: Text(widget.title),
			),
			body: Center(
				child: FlatButton(
					onPressed: () {
//						Navigator.push(
//							context,
//							MaterialPageRoute(builder: (context) => asdf())
//						);
						Navigator.pushNamed(context, '/asdf');
					},
					child: Text('zx,nvasdlk'),
				)
			),
		);
	}
}

class asdf extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		print('재빌드2');
		return Scaffold(
		  body: Container(
		  	child: Center(
		  		child: FlatButton(
		  			onPressed: () {
//		  				Navigator.push(
//		  					context,
//		  					MaterialPageRoute(builder: (context) => asdf2())
//		  				);
						    Navigator.pushNamed(context, '/asdf2');
		  			},
		  			child: Text('asdflkajsdfk'),
		  		),
		  	),
		  ),
		);
	}
}

class asdf2 extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		print("재빌드3");
		return Scaffold(
		  body: Container(
		  	child: Center(
		  		child: FlatButton(
		  			onPressed: () {
//		  				Navigator.push(
//		  					context,
//		  					MaterialPageRoute(builder: (context) => asdf())
//		  				);
						  Navigator.pushNamed(context, '/asdf');
		  			},
		  			child: Text('zxcmvnm,.'),
		  		),
		  	),
		  ),
		);
	}
}

