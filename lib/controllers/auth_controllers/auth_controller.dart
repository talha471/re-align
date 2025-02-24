import 'package:get/get.dart';
import 'package:re_align/constants/api_constants.dart';
import 'package:re_align/services/api/base_client.dart';

class AuthController extends GetxController {
  final isLoading = false.obs;
  final isOtpSent = false.obs;

  //final BaseApiService apiService = BaseApiService();

  /// 1. Send OTP
  // Future<void> sendOtp(String email) async {
  //   isLoading.value = true;

  //   apiService.apiUrl = ApiConstants.sendOTP;

  //   try {
  //     final response = await apiService.requestApiMethod(
  //       endPoints: ApiConstants.sendOTP,
  //       method: APIMethod.post,
  //       body: {
  //         'email': email,
  //       },
  //     );

  //     // Check if your backend indicates success in the response
  //     // For example, if your backend sets: { "success": true, "message": "OTP Sent" }
  //     final success = response['success'] ?? false;

  //     if (success) {
  //       final message = response['message'] ?? 'OTP sent successfully';
  //       // Show success message
  //       Get.snackbar('Success', message);

  //       // Mark OTP as sent
  //       isOtpSent.value = true;
  //     } else {
  //       // If backend returns success: false, show error message
  //       final errorMessage = response['message'] ?? 'Failed to send OTP.';
  //       Get.snackbar('Error', errorMessage);

  //       isOtpSent.value = false;
  //     }
  //   } catch (error) {
  //     // If an exception is thrown (ApiException, etc.)
  //     Get.snackbar('Error', error.toString());
  //     isOtpSent.value = false;
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  /// 1. Send OTP
  Future<void> sendOtp(String email) async {
    await BaseClient.safeApiCall(
      ApiConstants.sendOTP,
      RequestType.post,
      headers: await BaseClient.generateHeaders(),
      data: {
        'email': email,
      },
      onSuccess: (response) {
        isLoading.value = true;
        final success = response.data['success'] ?? false;

        if (success) {
          final message = response.data['message'] ?? 'OTP sent successfully';
          // Show success message
          Get.snackbar('Success', message);

          // Mark OTP as sent
          isOtpSent.value = true;
        } else {
          // If backend returns success: false, show error message
          final errorMessage =
              response.data['message'] ?? 'Failed to send OTP.';
          Get.snackbar('Error', errorMessage);

          isOtpSent.value = false;
        }
      },
      onLoading: () {
        isLoading.value = true;
      },
      onError: (e) {
        // If an exception is thrown (ApiException, etc.)
        Get.snackbar('Error', e.toString());
        isOtpSent.value = false;
      },
    );
  }

  // /// 2. Register the user after verifying OTP
  // Future<void> registerUser({
  //   required String email,
  //   required String password,
  //   required String confirmPassword,
  //   required String otp,
  // }) async {
  //   isLoading.value = true;

  //   final BaseApiService apiService = BaseApiService();
  //   apiService.apiUrl = 'http://localhost:5001/api/auth/register';

  //   try {
  //     final response = await apiService.requestApiMethod(
  //       method: APIMethod.post,
  //       body: {
  //         'email': email,
  //         'password': password,
  //         'confirmPassword': confirmPassword,
  //         'otp': otp,
  //       },
  //     );

  //     // Again, check success
  //     final success = response['success'] ?? false;
  //     if (success) {
  //       final message = response['message'] ?? 'Registration successful';
  //       Get.snackbar('Success', message);
  //     } else {
  //       final errorMessage = response['message'] ?? 'Registration failed';
  //       Get.snackbar('Error', errorMessage);
  //     }
  //   } catch (error) {
  //     // Handle any exceptions
  //     Get.snackbar('Error', error.toString());
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  /// 2. Register the user after verifying OTP
  Future<void> registerUser({
    required String email,
    required String password,
    required String confirmPassword,
    required String otp,
  }) async {
    await BaseClient.safeApiCall(ApiConstants.register, RequestType.post,
        headers: await BaseClient.generateHeaders(),
        data: {
          'email': email,
          'password': password,
          'confirmPassword': confirmPassword,
          'otp': otp,
        }, onSuccess: (response) {
      isLoading.value = true;
      // Again, check success
      final success = response.data['success'] ?? false;
      if (success) {
        final message = response.data['message'] ?? 'Registration successful';
        Get.snackbar('Success', message);
      } else {
        final errorMessage = response.data['message'] ?? 'Registration failed';
        Get.snackbar('Error', errorMessage);
      }
    }, onLoading: () {
      isLoading.value = true;
    }, onError: (e) {
      Get.snackbar('Error', e.toString());
      isLoading.value = false;
    });
  }
}
