extension RegexExtUtils on String {
  bool get isName {
    final fullNameRegex = RegExp(r'(\w+){2,}');
    return fullNameRegex.hasMatch(this);
  }

  bool get isEmail {
    final emailRegex = RegExp(
      r'^([a-zA-Z0-9_\-\.+]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$',
    );
    return emailRegex.hasMatch(this);
  }

  bool get isCPF {
    final cpf = replaceAll(RegExp('[^\\d]+'), '');
    if (cpf.isEmpty || cpf.length != 11) return false;
    if (RegExp(r'(\d)\1{10}').hasMatch(cpf)) return false;

    final allDigits = cpf.split('').map(int.parse).toList();
    final digits = allDigits.sublist(0, 9).reversed.toList();

    var v1 = 0, v2 = 0;
    for (var i = 0; i < 9; i++) {
      v1 += digits[i] * (9 - (i % 10));
      v2 += digits[i] * (9 - ((i + 1) % 10));
    }
    v1 = (v1 % 11) % 10;
    v2 += v1 * 9;
    v2 = (v2 % 11) % 10;

    return v1 == allDigits[9] && v2 == allDigits[10];
  }
}
