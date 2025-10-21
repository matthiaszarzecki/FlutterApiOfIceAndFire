/// Returns the character at the specified index of a string.
/// Returns an empty string if the index is out of bounds.
extension GetSafeCharacter on String {
  String safeIndex(int index) {
    return index < 0 || index >= length ? "" : this[index];
  }
}
