import 'package:mobx/mobx.dart';
import 'package:split_it/shared/models/repositories/firebase_repository.dart';
part 'step_two_controller.g.dart';

class StepTwoController = _StepTwoControllerBase with _$StepTwoController;

abstract class _StepTwoControllerBase with Store {
  final repository = FirebaseRepository();

  @observable
  List<Map<String, dynamic>> friends = [];

  @action
  Future<void> getFriends(String search) async {
    if (search.isNotEmpty) {
      friends = await this
          .repository
          .where(key: "name", value: search, collection: "friends");
    } else {
      friends = [];
    }
  }
}
