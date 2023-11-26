bool emailValidation(String email) {
  final RegExp emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
  return emailRegex.hasMatch(email);
}

bool passwordValidation(password) {
  final RegExp passwordRegex = RegExp(r'^(?=.*[0-9])[\w\W]{8,}$');
  return passwordRegex.hasMatch(password);
}

bool phoneValidator(password) {
  final RegExp passwordRegex = RegExp(r'^[0-9]{9,}$');
  return passwordRegex.hasMatch(password);
}
