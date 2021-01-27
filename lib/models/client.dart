class Client {
  final String uid;
  String name;
  String email;
  String password;

  Client({
    this.uid,
    this.name,
    this.email,
    this.password,
  });

  factory Client.fromJSON(Map<String, dynamic> json) {
    return Client(
        name: json['name'], email: json['email'], password: json['password']);
  }

  String toString() {
    return 'Name: $name  ||  Email: $email';
  }
}
