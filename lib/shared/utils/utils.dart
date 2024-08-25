class Utils {
  static String extractErrorMessage(dynamic error) {
    try {
      if (error is String) {
        return error;
      }

      return error.toString();
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  static String countryCodeToEmoji(String countryCode) {
    final int firstLetter = countryCode.codeUnitAt(0) - 0x41 + 0x1F1E6;
    final int secondLetter = countryCode.codeUnitAt(1) - 0x41 + 0x1F1E6;
    return String.fromCharCode(firstLetter) + String.fromCharCode(secondLetter);
  }
}
