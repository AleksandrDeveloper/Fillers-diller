
class User {
  int id;
  String email;
  String firstName;
  String lastName;
  String role;
  String userName;

  User(
    this.firstName,
    this.email,
    this.id,
    this.lastName,
    this.role,
    this.userName,
  );

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'],
        firstName = json['first_name'],
        lastName = json['last_nam'],
        role = json['role'],
        userName = json['username'];
}
