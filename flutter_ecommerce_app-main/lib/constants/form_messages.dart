
// Email and Phone Number matching patterns
final RegExp emailValidatorRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z]+\.[a-zA-Z]+");
final RegExp usernameValidatorRegExp = RegExp(r"^[a-zA-Z0-9.]");
RegExp phoneNumberValidatorRegExp =  RegExp(r"(^(?:[+0]9)?[0-9]{12}$)");


// Error messages
const String kUsernameNullError = "Please Enter your name";
const String kInvalidUsernameError = "Please Enter a valid name";

const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter a valid email";

// Password messages
const String kPasswordNullError = "Please Enter your password";
const String kShortPasswordError = "Password is too short";

const String kPasswordMatchError = "Passwords don\'t match";

// Profile Messages
const String kFirstNameNullError = "Please Enter your first name";
const String kLastNameNullError = "Please Enter your last name";

const String kPhoneNumberNullError = "Please Enter your phone number";
const String kValidPhoneNumberError = "Please Enter a valid phone number";

const String kAddressNullError = "Please Enter your address";