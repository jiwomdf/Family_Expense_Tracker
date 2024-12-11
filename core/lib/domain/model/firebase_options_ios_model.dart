class FirebaseOptionsIOSModel {
  String fName;
  String apiKey;
  String appId;
  String messagingSenderId;
  String projectId;
  String storageBucket;
  String iosBundleId;

  FirebaseOptionsIOSModel({
    required this.fName,
    required this.apiKey,
    required this.appId,
    required this.messagingSenderId,
    required this.projectId,
    required this.storageBucket,
    required this.iosBundleId,
  });

  bool isAllFieldEmpty() {
    return fName.isEmpty &&
        apiKey.isEmpty &&
        appId.isEmpty &&
        messagingSenderId.isEmpty &&
        projectId.isEmpty &&
        storageBucket.isEmpty &&
        iosBundleId.isEmpty;
  }

  Map<String, dynamic> toJson() => {
        'fName': fName,
        'apiKey': apiKey,
        'appId': appId,
        'messagingSenderId': messagingSenderId,
        'projectId': projectId,
        'storageBucket': storageBucket,
        'iosBundleId': iosBundleId,
      };

  factory FirebaseOptionsIOSModel.fromMap(Map<String, dynamic> map) =>
      FirebaseOptionsIOSModel(
        fName: map['fName'] ?? '',
        apiKey: map['apiKey'] ?? '',
        appId: map['appId'] ?? '',
        messagingSenderId: map['messagingSenderId'] ?? '',
        projectId: map['projectId'] ?? '',
        storageBucket: map['storageBucket'] ?? '',
        iosBundleId: map['iosBundleId'] ?? '',
      );
}
