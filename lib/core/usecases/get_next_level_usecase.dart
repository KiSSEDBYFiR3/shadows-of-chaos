abstract class IGetNextLevel {
  Future<void> call(String uid, String page, {String level = 'levelOne'});
}
