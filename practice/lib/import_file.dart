import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Image retImage({String str, double width, double height}) {
	return Image.network(str, width: width, height: height);
}

class MyText extends StatelessWidget {
	final String data;
	final double size;

	MyText(this.data,
		this.size);

	@override
	Widget build(BuildContext context) {
		return Text(
			this.data,
			style: TextStyle(
				fontSize: this.size,
			),
		);
	}
}

class MyButtonTheme extends StatefulWidget {
	final double _width;
	final double _height;
	final String str;
	final double fontSize;
	bool toggle=true;

	MyButtonTheme(this._width,
		this._height,
		this.str,
		this.fontSize,);

	double get width {
		return this._width;
	}

	double get height {
		return this._height;
	}

	ButtonTheme myButtonType(double width, double height, String str,
		double fontSize) {
		return ButtonTheme(
			minWidth: this.width,
			height: this.height,
			child: FlatButton(
				child: MyText(str, fontSize),
				onPressed: (){
					_changeState(!toggle);
				},
				color: changeButtonColor(),
			),
		);
	}

	@override
	_MyButtonThemeState createState() => _MyButtonThemeState();

  void _changeState(bool param0) {
  	toggle = param0;

  }

	Color changeButtonColor() {
		if (this.toggle) {
			return Color.fromRGBO(253, 216, 53, 1.0);
		} else {
			return Color.fromRGBO(1, 1, 1, 1.0);
		}
	}
}

class _MyButtonThemeState extends State<MyButtonTheme> {
	@override
	Widget build(BuildContext context) {
		return widget.myButtonType(
			widget.width, widget.height, widget.str, widget.fontSize);
	}
}
