part of base_constants;

extension DoubleExtension on int {
  // /// Height by MediaQuery
  // double get hh {
  //   return BaseSize.height(this);
  // }
  //
  // /// Width by MediaQuery
  // double get ww {
  //   return BaseSize.width(this);
  // }

  /// Vertical Spaced SizedBox
  Widget get toVSB {
    return SizedBox(height: toDouble());
  }

  /// Horizontal Spaced SizedBox
  Widget get toHSB {
    return SizedBox(width: toDouble());
  }

  /// All Circular BorderRadius
  BorderRadius get toAllBorderRadius {
    return BorderRadius.all(Radius.circular(toDouble()));
  }

  /// All EdgeInsets
  EdgeInsets get toAll {
    return EdgeInsets.all(toDouble());
  }

  /// Vertical EdgeInsets
  EdgeInsets get toVertical {
    return EdgeInsets.symmetric(vertical: toDouble());
  }

  /// Horizontal EdgeInsets
  EdgeInsets get toHorizontal {
    return EdgeInsets.symmetric(horizontal: toDouble());
  }

  /// Horizontal EdgeInsets
  Radius get toRadius {
    return Radius.circular(toDouble());
  }
}

extension ObjectExtension on Object? {
  /// Log in debug mode
  void get toLog {
    if (kDebugMode) {
      print('[x]::MYVILLAGE::LOG:: $this');
    }
  }

  /// Http log in debug mode
  void get toHttpLog {
    if (kDebugMode) {
      print('[x]::MYVILLAGE::HTTP:: $this');
    }
  }

  /// Error log in debug mode
  void get toErrorLog {
    if (kDebugMode) {
      print('[x]::MYVILLAGE::ERROR:: $this');
    }
  }
}

extension StringExtension on String {
  SnackbarController get showSnackBar {
    final snackBar = GetSnackBar(
      message: this,
      isDismissible: true,
      borderRadius: 8.0,
      padding: 16.toAll,
      margin: 16.toAll,
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(milliseconds: 2000),
      backgroundColor: BaseColors.primary,
    );

    return Get.showSnackbar(snackBar);
  }

  SnackbarController showSnackBarOnComplete({
    required Function(SnackbarStatus? status) status,
  }) {
    final snackBar = GetSnackBar(
      message: this,
      isDismissible: true,
      borderRadius: 8.0,
      padding: 16.toAll,
      margin: 16.toAll,
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(milliseconds: 2000),
      backgroundColor: Colors.green,
      snackbarStatus: status,
    );

    return Get.showSnackbar(snackBar);
  }

  SnackbarController get showErrorSnackBar {
    final snackBar = GetSnackBar(
      message: this,
      isDismissible: true,
      borderRadius: 8.0,
      padding: 16.toAll,
      margin: 16.toAll,
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(milliseconds: 2000),
      backgroundColor: BaseColors.error,
    );

    return Get.showSnackbar(snackBar);
  }
}
