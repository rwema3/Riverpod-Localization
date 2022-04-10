abstract class PersistentState<T> {
  Future<bool> localSave();
  Future<bool> localDelete();
  Future<T?> fromStorage();
}
