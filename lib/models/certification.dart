class Certification {
  String name;
  String description;
  String logo;
  String source_url;
  String criteria;
  bool promise;
  bool questionairre;
  bool audit;
  bool transparent;
  bool conflict;

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
      this.conflict});

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
        conflict: json['conflict']);
  }

  String toString() {
    return 'Name: $name  ||  Description: $description';
  }
}
