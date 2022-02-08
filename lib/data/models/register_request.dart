class RegisterRequest {
  String name;
  String email;
  String password;

  RegisterRequest(
      {required this.name, required this.email, required this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["name"] = this.name;
    data["email"] = this.email;
    data["password"] = this.password;
    return data;
  }
}
