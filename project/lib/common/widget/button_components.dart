import 'package:flutter/material.dart';
import 'text_components.dart';

class CategoryButtonComponent extends StatelessWidget {

	CategoryButtonComponent({this.str});

	final String str;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
	    minWidth: 54.0,
	    height: 30.0,
	    child: OutlineButton(
		    onPressed: () {},
		    borderSide: BorderSide(color: Color.fromRGBO(253, 216, 53, 1.0)),
		    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
		    child: MyText(str: str, size: 12.0),
	    ),
    );
  }
}


class MyImageButton extends StatelessWidget {

	MyImageButton({@required this.onPressed, this.child});

	final Function onPressed;
	final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
	    onTap: onPressed,
      child: child,
    );
  }
}

