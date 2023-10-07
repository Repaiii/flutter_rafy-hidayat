class Contact {
  final int id;
  final String name;
  final String phone;

  Contact({
    required this.id,
    required this.name,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
    };
  }
}
