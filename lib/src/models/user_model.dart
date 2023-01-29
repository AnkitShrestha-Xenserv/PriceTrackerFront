class UserModel {
  final int userId;
  final String username;
  final String password;
  final String firstName;
  final String lastName;
  final String phoneNumber;

  UserModel()
      : userId = -1,
        username = "",
        password = "",
        firstName = "",
        lastName = "",
        phoneNumber = "";

  UserModel.fromJson(Map<String, dynamic> parsedJson)
      : userId = parsedJson["userId"],
        username = parsedJson["username"],
        password = parsedJson["password"],
        firstName = parsedJson["firstName"] ?? "",
        lastName = parsedJson["lastName"] ?? "",
        phoneNumber = parsedJson["phoneNumber"] ?? "";
}
