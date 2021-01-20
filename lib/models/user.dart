
class User {
  String name;
  String email;
  String password;


    User({
    this.name,
    this.email,
    this.password,
  });

  factory User.fromJSON(Map<String, dynamic> json) {
    return User(name: json['name'], email: json['email'], password: json['password']);
  }

  String toString() {
    return 'Name: $name  ||  Email: $email';
  }
}
