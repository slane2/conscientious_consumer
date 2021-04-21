class Bill {
  String name = 'Hello';
  String description = '';
  String source_name = '';
  String source_url = '';
  String year = '';
  String passed = '';

  Bill({
    this.name,
    this.description,
    this.source_name,
    this.source_url,
    this.year,
    this.passed,
  });

  factory Bill.fromJSON(Map<String, dynamic> json) {
    return Bill(
        name: json['name'],
        description: json['description'],
        source_name: json['source_name'],
        source_url: json['source_url'],
        year: json['year'],
        passed: json['pass']);
  }

  String toString() {
    return 'Name: $name  ||  Description: $description - $source_name';
  }
}
