validateNullCheckOperation(dynamic value,
    {String errorMessage = "Bu alan boş bırakılamaz"}) {
  if (value == null || value.isEmpty) {
    return errorMessage;
  }
  return null;
}

validateOperation(dynamic value, String errorMessage,
    {int minCharacterCount = 0}) {
  if (value == null || value.isEmpty || value.length < minCharacterCount) {
    return errorMessage;
  }
  return null;
}

emailValidateOperation(dynamic email) {
  bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

  if (email == null || email.isEmpty || !emailValid) {
    return "Geçerli bir e-posta adresi giriniz !";
  }
  return null;
}

checkUserNameValidation(bool value) {
  if (!value) {
    return "*Bu kullanıcı adı zaten kullanımda";
  }
  return null;
}
