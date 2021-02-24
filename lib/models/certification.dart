class Certification {
  String name = '';
  String description = '';
  String logo = '';
  String source_url = '';
  String criteria = '';
  bool promise = false;
  bool questionairre = false;
  bool audit = false;
  bool transparent = false;
  bool conflict_free = false;
  int rating = 0;

  Certification(
      {this.name,
      this.description,
      this.logo,
      this.source_url,
      this.criteria,
      this.promise,
      this.questionairre,
      this.audit,
      this.transparent,
      this.conflict_free,
      this.rating});

  factory Certification.fromJSON(Map<String, dynamic> json) {
    return Certification(
        name: json['name'],
        description: json['description'],
        logo: json['logo'],
        source_url: json['source_url'],
        criteria: json['criteria'],
        promise: json['promise'],
        questionairre: json['questionairre'],
        audit: json['audit'],
        transparent: json['transparent'],
        conflict_free: json['conflict_free'],
        rating: json['rating']);
  }

  String toString() {
    return 'Name: $name  ||  Description: $description';
  }
}
