import 'dart:convert';

import "package:http/http.dart";
import 'package:ui_post/model/emp_model.dart';

import '../model/newPost.dart';

class Network {
    static String BASE = "dummy.restapiexample.com";



  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  static String API_GET = "/api/v1/employees";
  static String API_GET_ONE = "/api/v1/employees/";
  static String API_POST = "/api/v1/create";
  static String API_PUT = "/api/v1/update";
  static String API_DELETE = "/api/v1/delete/";

  /* API_GET */
  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api, params);

    var response = await get(uri, headers: headers);

    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  /* API_POST */
  static Future<String?>POST(String api, Map<String, String> params) async{
    var uri = Uri.http(BASE,api);
    var response = await post(uri,headers: headers, body: jsonEncode(params));

    if(response.statusCode == 200 || response.statusCode ==201){
      return response.body;
    }
    return null;
  }



  /* API_PUT */
  static Future<String?>PUT(String api, Map<String, String> params) async{
    var uri = Uri.http(BASE,api);
    var response = await put(uri,headers: headers, body: jsonEncode(params));

    if(response.statusCode == 200 || response.statusCode ==202){
      return response.body;
    }
    return null;
  }


  /* API_DEL */

  static Future<String?>DEL(String api, Map<String, String> params) async{
    var uri = Uri.http(BASE,api);
    var response = await put(uri,headers: headers);

    if(response.statusCode == 200){
      return response.body;
    }
    return null;
  }


  /* PARAMS */

  static Map<String,String> paramsEmpty(){
    Map<String,String> params = {};
    return params;
  }

  static Map<String,String> paramsCreate(Employee employee){
    Map<String,String> params = {};
    params.addAll({
      "id": employee.id!.toString(),
      "employee_name": employee.employeeName!,
      "employee_salary": employee.employeeSalary!.toString(),
      "employee_age": employee.employeeAge!.toString(),
      "profile_image": employee.profileImage!,
    });

    return params;
  }


  static Map<String,String> paramsUpdate(Employee employee){
    Map<String,String> params = {};
    params.addAll({
      "id": employee.id!.toString(),
      "employee_name": employee.employeeName!,
      "employee_salary": employee.employeeSalary!.toString(),
      "employee_age": employee.employeeAge!.toString(),
      "profile_image": employee.profileImage!,
    });
    print("===================================api>>>>>>>>>>>${params}");
    return params;
  }
  
  /* HTTP PARSING*/
  /*  */
static List<Employee> parsePostList(String response){
  dynamic json = jsonDecode(response);
  var data = List<Employee>.from(json.map((x)=> Employee.fromJson(x)));
  print("===================================api>>>>>>>>>>>${data}");
  return data;
}

}
