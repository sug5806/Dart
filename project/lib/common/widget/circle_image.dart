import 'package:flutter/material.dart';

class MyCircleAvatar extends StatelessWidget {

	MyCircleAvatar({@required this.image});

	final String image;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
	    radius: 15.0,
	    backgroundImage: NetworkImage(
		    image,
	    ),
    );
  }
}
