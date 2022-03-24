class Contact {
  String? id;
  String name;
  String phoneNumber;

  Contact(this.name, this.phoneNumber, [this.id]);

  Contact.fromJson(String id, Map<String, dynamic> json) : this(
      json['name'], json['phoneNumber'], id
  );

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "phoneNumber": phoneNumber,
    };
  }


}
