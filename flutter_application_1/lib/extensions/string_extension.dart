extension GetSafeCharacter on String {
  String safeIndex(int index) => index < 0 || index >= length ? "" : this[index];
}