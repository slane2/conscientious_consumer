
class Bill {
  String name;
  String description;
  String source_name;
  String source_url;
  DateTime date;
  bool passed;

    Bill({
    this.name,
    this.description,
    this.source_name,
    this.source_url,
    this.date,
    this.passed,
  });

  factory Bill.fromJSON(Map<String, dynamic> json) {
    return Bill(name: json['name'], description: json['description'], source_name: json['source_name'], 
    source_url: json['source_url'], date: json['date'], passed: json['pass']);
  }

  String toString() {
    return 'Name: $name  ||  Description: $description - $source_name';
  }
}
