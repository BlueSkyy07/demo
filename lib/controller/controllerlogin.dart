import 'package:get/get.dart';

class ControllerLogin extends GetxController {
  RxBool checkLogin = false.obs;
  RxString userEmail = ''.obs;
  RxString displayName = ''.obs;
  RxString sex = 'nam'.obs;

  void loginSuccess() {
    checkLogin.value = true;
    print("checkLogin is now: ${checkLogin.value}");
    print("userEmail is now: ${userEmail.value}");
    print("displayName is now: ${displayName.value}");
    // displayName.value = "minhthai";
  }

  void changeSex() {
    sex.value = 'nu';
    print("sex: ${sex.value}");
  }
}
