class Post{
  String? id;
  String? employeeName;
  String? employeeSalary;
  String? employeeAge;
  String? profileImage;

  Post({this.id,this.employeeName,this.employeeSalary,this.employeeAge,this.profileImage});

  Post.fromJson(Map<String,dynamic> json)
  : id = 'id',
        employeeName = 'employee_name',
        employeeSalary = 'employee_salary',
        employeeAge = 'employee_age',
        profileImage = 'profile_image';

  Map<String,dynamic> toJson()=>{
    'id' : id,
    'employee_name' : employeeName,
    'employee_salary' : employeeSalary,
    'employee_age' : employeeAge,
    'profile_image' : profileImage,
  };

}