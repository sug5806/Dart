import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';


class NetworkHelper{
	NetworkHelper(this.url);

	final String url;

	Future getData() async {
		http.Response response = await http.get(url);

		if (response.statusCode == 200){
			String data = response.body;

			return jsonDecode(data);
		} else {
			print(response.statusCode);
		}
	}

}