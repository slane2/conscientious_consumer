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

  void addName(String bill_name) {
    name = bill_name;
  }

  void addDescription(String bill_description) {
    description = bill_description;
  }

  void addSourceName(String bill_source_name) {
    source_name = bill_source_name;
  }

  void addYear(String bill_year) {
    year = bill_year;
  }

  void addPassed(String bill_passed) {
    passed = bill_passed;
  }

  String toString() {
    return 'Name: $name  ||  Description: $description - $source_name';
  }
}
