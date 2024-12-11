class FirebaseOptionsWebModel {
  String fName;
  String apiKey;
  String authDomain;
  String projectId;
  String storageBucket;
  String messagingSenderId;
  String appId;
  String measurementId;

  FirebaseOptionsWebModel({
    required this.fName,
    required this.apiKey,
    required this.authDomain,
    required this.projectId,
    required this.storageBucket,
    required this.messagingSenderId,
    required this.appId,
    required this.measurementId,
  });

  bool isAllFieldEmpty() {
    return fName.isEmpty &&
        apiKey.isEmpty &&
        authDomain.isEmpty &&
        projectId.isEmpty &&
        storageBucket.isEmpty &&
        messagingSenderId.isEmpty &&
        appId.isEmpty &&
        measurementId.isEmpty;
  }

  Map<String, dynamic> toJson() => {
        'fName': fName,
        'apiKey': apiKey,
        'authDomain': authDomain,
        'projectId': projectId,
        'storageBucket': storageBucket,
        'messagingSenderId': messagingSenderId,
        'appId': appId,
        'measurementId': measurementId,
      };

  factory FirebaseOptionsWebModel.fromMap(Map<String, dynamic> map) =>
      FirebaseOptionsWebModel(
        fName: map['fName'] ?? '',
        apiKey: map['apiKey'] ?? '',
        authDomain: map['authDomain'] ?? '',
        projectId: map['projectId'] ?? '',
        storageBucket: map['storageBucket'] ?? '',
        messagingSenderId: map['messagingSenderId'] ?? '',
        appId: map['appId'] ?? '',
        measurementId: map['measurementId'] ?? '',
      );
}
