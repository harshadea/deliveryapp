/* <-------- Enums for various screens --------> */

enum ResetPasswordSelectedChoice {
  none,
  mail,
  phoneNumber,
}

enum PasswordStrongLevel {
  none,
  error,
  weak,
  normal,
  strong,
  veryStrong,
}

enum LanguageSetting { english, russian, french, canada, australian, german }

enum HomeScreenStatus { offline, online, newTask, pickedTask }
