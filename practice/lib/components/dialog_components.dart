import 'package:flutter/material.dart';


class MyDialog extends StatelessWidget {

	MyDialog({
		@required this.onPressed,
		@required this.dialogChild,
	});

	final Widget dialogChild;
	final Function onPressed;

	@override
	Widget build(BuildContext context) {
		return GestureDetector(
			onTap: onPressed,
			child: Container(
				child: dialogChild,
			),
		);
	}
}
