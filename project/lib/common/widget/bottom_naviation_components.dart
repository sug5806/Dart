import 'package:flutter/material.dart';

class MyBTNAV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
	    type: BottomNavigationBarType.fixed,
	    currentIndex: 0,
	    items: [
		    BottomNavigationBarItem(
			    icon: Icon(Icons.camera_alt,
				    color: Colors.grey,
			    ),
			    title: Text(
				    '촬영',
				    style: TextStyle(
					    color: Colors.grey,
				    ),
			    ),
		    ),
		    BottomNavigationBarItem(
			    icon: Icon(Icons.grid_on,
				    color: Colors.grey,
			    ),
			    title: Text(
				    '앨범',
				    style: TextStyle(
					    color: Colors.grey,
				    ),
			    ),
		    ),
		    BottomNavigationBarItem(
			    icon: Icon(Icons.system_update,
				    color: Colors.grey,
			    ),
			    title: Text(
				    '템플릿',
				    style: TextStyle(
					    color: Colors.grey,
				    ),
			    ),
		    ),
		    BottomNavigationBarItem(
			    icon: Icon(Icons.store,
			    color: Colors.grey,
			    ),
			    title: Text(
				    '판매',
				    style: TextStyle(
					    color: Colors.grey,
				    ),
			    ),
		    ),
		    BottomNavigationBarItem(
			    icon: Icon(Icons.settings,
				    color: Colors.grey,
			    ),
			    title: Text(
				    '촬영',
				    style: TextStyle(
					    color: Colors.grey,
				    ),
			    ),
		    ),
	    ],
    );
  }
}
