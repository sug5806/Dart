import 'package:flutter/material.dart';

class MyText extends StatelessWidget {

	MyText({this.str, this.size, this.bold = false});

	final String str;
	final double size;
	final bool bold;


	FontWeight _bold(){
		return bold ? FontWeight.bold : null;
	}

  @override
  Widget build(BuildContext context) {
    return Text(
	    str,
	    style: TextStyle(
		    fontSize: size,
		    fontWeight: _bold(),
	    ),
    );
  }
}
