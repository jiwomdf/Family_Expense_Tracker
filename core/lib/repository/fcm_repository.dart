import 'package:core/data/network/request/send_fcm_request.dart';
import 'package:core/domain/model/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class FcmRepository {
  static const serverKey =
      'BFqleOfs1_lZucrymHE3NEdF0cnr_gHwdMcXnH_iu9EL1FBvdIK1rR0GgaUAq1aLoPOWbxu2DWi44XRWF1ryA30';
  static const baseURL = 'https://fcm.googleapis.com/';
  final http.Client client;

  FcmRepository({required this.client});

  Future<Either<Failure, bool>> sendFcm(SendFcmRequest request) async {
    try {
      final response = await client.post(Uri.parse('$baseURL/fcm/send'),
          body: request.toJson().toString(),
          headers: {
            'Content-type': 'application/json',
            'Authorization': 'key=$serverKey',
          });
      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(ServerFailure(response.body.toString()));
      }
    } catch (e) {
      return Left(GeneralFailure(e.toString()));
    }
  }
}
