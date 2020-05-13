import 'package:mobx/mobx.dart';
part 'app.store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {

  @observable
  String userName = '';

  @observable
  String userEmail = '';

  @action
  setUserEmail(String newEmail) => this.userEmail = newEmail;

  @action
  setUserName(String newName) => this.userName = newName;
}