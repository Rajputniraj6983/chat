
class Modal {
  String? name, email;

  Modal({required this.name, required this.email});

  factory Modal.fromJson(Map m1) {
    return Modal(name: m1['name'], email: m1['email']);
  }

  Map<String, dynamic> toMap(Modal modal) {
    return {
      'name': modal.name??'niraj',
      'email': modal.email??'niraj@gmail.com',
    };
  }
}

