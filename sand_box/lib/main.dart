import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Data{
  Map<String, dynamic> _datas = <String, dynamic>{};
}
void main() {
  api();
}

void api() async {
  var url = 'https://works.storebeta.co.kr:444/exec/proajax.php?act=store&han=get_list2&stype=ALL';
  Data responseData = new Data();

  var response = await http.get(url);
  if (response.statusCode == 200){
    print(responseData._datas);
    var jsonResponse = convert.jsonDecode(response.body);
  }
}