class User {
  String email;
  String password;

  String validateEmail(email) {
    bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+")
        .hasMatch(email);
    if (!emailValid) return "There was an issue with your email";
    this.email = email;
    return null;
  }

  String validatePassword(password) {
    bool passwordValid = password.length >= 6 ? true : false;
    if (!passwordValid) return "There was an issue with your password";
    this.password = password;
    return null;
  }
}
