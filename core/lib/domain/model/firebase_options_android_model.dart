class FirebaseOptionsAndroidModel {
  String fName;
  String apiKey;
  String appId;
  String messagingSenderId;
  String projectId;
  String storageBucket;

  FirebaseOptionsAndroidModel({
    required this.fName,
    required this.apiKey,
    required this.appId,
    required this.messagingSenderId,
    required this.projectId,
    required this.storageBucket,
  });

  bool isAllFieldEmpty() {
    return fName.isEmpty &&
        apiKey.isEmpty &&
        appId.isEmpty &&
        messagingSenderId.isEmpty &&
        projectId.isEmpty &&
        storageBucket.isEmpty;
  }

  Map<String, dynamic> toJson() => {
        'fName': fName,
        'apiKey': apiKey,
        'appId': appId,
        'messagingSenderId': messagingSenderId,
        'projectId': projectId,
        'storageBucket': storageBucket,
      };

  factory FirebaseOptionsAndroidModel.fromMap(Map<String, dynamic> map) =>
      FirebaseOptionsAndroidModel(
        fName: map['fName'] ?? '',
        apiKey: map['apiKey'] ?? '',
        appId: map['appId'] ?? '',
        messagingSenderId: map['messagingSenderId'] ?? '',
        projectId: map['projectId'] ?? '',
        storageBucket: map['storageBucket'] ?? '',
      );
}
