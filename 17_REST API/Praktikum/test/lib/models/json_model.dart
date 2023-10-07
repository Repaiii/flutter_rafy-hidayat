class Contacts {
  final int id;
  final String name;
  final String phone;

  Contacts({
    required this.id,
    required this.name,
    required this.phone,
  });

  factory Contacts.fromJson(Map<String, dynamic> json) {
    return Contacts(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
    );
  }
}