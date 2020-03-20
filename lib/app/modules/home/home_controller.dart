import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  double offset = 0.0;

  @action
  setOffset(double offset) =>
      offset != null ? this.offset = offset * 0.00095 : null;
}
