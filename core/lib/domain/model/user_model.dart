class UserModel {
  final String uid;
  UserModel({required this.uid});
}

class UserDataModel {
  final String uid;
  final String name;
  final String email;

  UserDataModel({
    required this.uid,
    required this.name,
    required this.email,
  });

  String getDisplayName() {
    if (name.trim() != "") {
      return name;
    } else {
      return email;
    }
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'email': email,
      };

  factory UserDataModel.fromMap(Map<String, dynamic> map) => UserDataModel(
        uid: map['uid'],
        name: map['name'],
        email: map['email'],
      );
}
