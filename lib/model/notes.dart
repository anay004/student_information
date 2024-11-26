//model class
class Note {
  String? id;
  String? name;
  String? phone;
  String? department;
  String? email;
  String? address;

  //constructor
  Note({
    required this.id,
    required this.name,
    required this.phone,
    required this.department,
    required this.email,
    required this.address,
  });


  //for saving data to db
  //name must be same as table name in db
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone' : phone,
      'department' : department,
      'email' : email,
      'address' : address,

    };
  }

  //for retrieving data from db
  static Note fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      name: map['name'],
      phone: map['phone'],
      department: map['department'],
      email: map['email'],
      address: map['address'],
    );
  }
}