class UserModel {
  UserData? user;
  String? message;

  UserModel.fromJson(Map<String, dynamic> json)
  {
    user = UserData.fromJson(json['user']);
    message = json['message'];
  }
}


class UserData {
  int? id;
  String? firstName;
  String? lastName;
  String? gender;
  String? birthDate;
  String? userPhoto;
  String? email;
  int? roleId;
  List<UserProgress>? userProgress=[];   // Get User Progress in each Unit
  List<UserUnits>? units=[];
  List<int>userLanguages=[];             //To be filled later in cubit, has the ID's of taken courses
  Map<int,List<int>>userUnits={};        //To be filled later in cubit, has the ID's of userUnits. first int in the map is language id , second int is the unit ID


  UserData.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    birthDate = json['birth_date'];
    userPhoto = json['user_photo'];
    email = json['email'];
    roleId = json['role_id'];

    if(json['units'] !=null)
      {
        json['units'].forEach((element)
        {
          units?.add(UserUnits.fromJson(element));
        });
      }

    if(json['user_progress'] !=null)
      {
        json['user_progress'].forEach((element)
        {
          userProgress?.add(UserProgress.fromJson(element));
        });
      }
  }

}


class UserUnits
{
  int? unitId; //Current Unit Id
  String? unitStatus;
  int? languageId; //The Language that contains this unit.

  UserUnits.fromJson(Map<String,dynamic>json)
  {
    unitId= json['id'];
    unitStatus=json['unit_status'];
    languageId=json['language_id'];
  }
}


class UserProgress
{
  int? languageId;
  String? progress;

  UserProgress.fromJson(Map<String,dynamic> json)
  {
    languageId= json['language id'];
    progress= json['progress'];
  }
}
