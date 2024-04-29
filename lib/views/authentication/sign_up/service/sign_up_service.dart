import 'package:haydi_express_restaurant/core/consts/endpoints.dart';
import 'package:haydi_express_restaurant/views/authentication/models/mail_verification_request_model.dart';

import '../../../../core/managers/network_manager.dart';
import '../../models/mail_verification_model.dart';

final class SignUpService extends NetworkManager {
  Future<MailVerificationRequestModel?> sendVerifyRequest(
      MailVerificationRequestModel data) async {
    try {
      final response = await network.post(
          Endpoints.instance.mailVerificationRequest,
          data: data.toJson());
      return MailVerificationRequestModel.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }

  Future<MailVerificationModel?> verifyMailCode(
      MailVerificationModel data) async {
    try {
      final response = await network.post(Endpoints.instance.mailVerification,
          data: data.toJson());
      return MailVerificationModel.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }
}
