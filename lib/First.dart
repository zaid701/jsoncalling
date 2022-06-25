import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:jsoncalling/model.dart';
import 'package:jsoncalling/zaid.dart';

class First extends StatefulWidget {
  const First({Key? key}) : super(key: key);

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  var token="eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyIiwianRpIjoiZjM3MzhlZTZlMWYwNzc5Y2U5ZWJhYzQxZTZlOWJlMDI3M2EzMzFjOGI1ZjVjNGU1YmMxOWYzNjJhZjRlMjBiYjkxYTc0MGU5ZTM2MWU0ODgiLCJpYXQiOjE2NTYwNjcyMzYuNDIxNTc0LCJuYmYiOjE2NTYwNjcyMzYuNDIxNTgsImV4cCI6MTY4NzYwMzIzNi40MTUyMzEsInN1YiI6IjIiLCJzY29wZXMiOltdfQ.Aiius6PuU5TE1yvih4wzEO7W9lgmMgawipYErBLu7Blh7t2vmbH6VCSXOZv65BkBvHh4hNX0-3_DdnxfuxjNCCt5KLpxOqY69Fb58jMG-pYqQyxJ9EID0KOM37AA_0cBzU-lqtZ8eBxYKndysmYzr2s2CdpHSIPLf6mSd7M3Ls-iDojGKSd9Q16Ay8vOpKUkfJtE46yJZANasfPUimeQ6EEgnniQCnsJl5WREJ9x7p1svoOMrsmaK7n7euMq5MGM6imI4zLZbp7EoZ1oiY-tkfRNNEa0Sp5AFirhlDQeYgGm24qIcii1R7xWNl7alMltsk_ehSYcD7BgvSc87U87MPwOKNz24OWpa6zU1hj2s63wpVNfzQoQN-KKN1crHjnv0F_HmtEVW0qtyGe7vZPKFJyTdjzrlwsQ6Rx-D2ezbZArA--DxnmkBr3xTBuSGPK2YgwwoMRrTwn4sOmDfMbzS3_C38PU-F4XiL8z6f_tdrbSLwzVaQUaVY9PMK2GVJhDtOXvCAc5052-dNolDYZz0WIfOYcrwVhmkumOmxws-p9yiXSWWRcVod-VIfAcuoSl_ZeHlycFwV71RTCAd8vT6WbVzyUQ7eoeXe5r6HbQjKOXMxYYvJTMFNNX0Wm1dM_WwgeD_vOXVqaLv-3rPWf8XxWaTN_9tEsDlZhFTgetiTE" ;



  Uri uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
  late TicketList Item;

   getdata() async {
    final response = await Client().get(
        Uri.parse("http://44.234.205.222/peakonline/api/user/ticket/list"),
        headers:headerWithToken(token:token));
        print(response.statusCode.toString());
     return TicketList.fromJson(json.decode(response.body));

    
  }

  Future<List<Model>> readjson() async {
    final String responce = await rootBundle.loadString("asset/data.json");
    final usermap = jsonDecode(responce) as List<dynamic>;
    List<Model> zaid = usermap.map((e) => Model.fromMap(e)).toList();
    return zaid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: getdata(),
          builder: (builder, data) {
            if (!data.hasData) {
              return Center(child: Text("Error"));
            }
            else {
              Item = data.data as TicketList;
              List<PaginateData>? pages=Item.data?.paginateData;
              return ListView.builder(
                  itemCount: pages?.length ,
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: Text("${pages![index].title}"),
                        leading: Text(pages[index].userId.toString()),
                        subtitle: Text(pages[index].content.toString(), maxLines: 2,
                          overflow: TextOverflow.ellipsis,)
                    );
                  });
            }
          }
      ),
    );
  }

  Map<String, String> headerWithToken({required String token}) {
    return {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
  }
}





