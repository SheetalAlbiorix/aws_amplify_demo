part of helpers;

final SignInScreenController controller = Get.find();

String? validateName(String value) {
  String pattern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return "Name is Required";
  } else if (!regExp.hasMatch(value)) {
    return "Name must be a-z and A-Z";
  }
  return null;
}

String? validateUserName(String value) {
  if (value.isEmpty) {
    return "UserName is Required";
  }
  return null;
}

String? validateMobile(String value) {
  String pattern = r'(^[0-9]*$)';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return "Mobile is Required";
  } else if (value.length != 10) {
    return "Mobile number must 10 digits";
  } else if (!regExp.hasMatch(value)) {
    return "Mobile Number must be digits";
  }
  return null;
}

String? validatePasswordLength(String? value) {
  if (value!.isEmpty) {
    return "Password can't be empty";
  } else if (value.length < 3) {
    return "Password must be longer than 3 characters";
  }
  return null;
}

RxString validateEmail(String? value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(pattern);
  if (value!.isEmpty) {
    controller.checkBoxBool.value = true;
    controller.signInError.value = "Email is Required";
    return controller.signInError;
  } else if (!regExp.hasMatch(value)) {
    if (!controller.checkBoxBool.value) {
      controller.checkBoxBool.value = true;
      controller.signInError.value = "Invalid Email";
    }

    return controller.signInError;
  } else {
    controller.checkBoxBool.value = false;
    return controller.signInError;
  }
}

String? validateFirstName(String? value) {
  if (value!.isEmpty) {
    return "Name is Required";
  } else {
    return null;
  }
}

String? validateLastName(String value) {
  if (value.isEmpty) {
    return "LastName is Required";
  } else {
    return null;
  }
}

String? validateDescription(String value) {
  if (value.isEmpty) {
    return "Description is Required";
  } else {
    return null;
  }
}
