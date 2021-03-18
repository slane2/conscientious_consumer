class Company {
  final int id;
  String name;
  List<String> certificates;
  List<String> otherCertificates;
  String description;
  String logo;
  int parentCompanyName; //or should I do ID? The form asks for the name
  String billsLobbiedFor;
  String address;
  String phone;
  String site;

  Company(
      {this.id,
      this.name,
      this.certificates,
      this.otherCertificates,
      this.description,
      this.logo,
      this.parentCompanyName,
      this.billsLobbiedFor: 'This company hasn\'t lobbied for any bills',
      this.address: '',
      this.phone: ''});
}