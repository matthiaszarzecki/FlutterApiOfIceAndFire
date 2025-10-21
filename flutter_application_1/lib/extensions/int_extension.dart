/// Returns true when the integer is between 200 and 299 inclusive.
extension StatusResponseIsSuccesful on int {
  bool isSuccessful() {
    return this >= 200 && this <= 299;
  }
}