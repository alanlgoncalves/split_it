import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:split_it/modules/login/login_controller.dart';
import 'package:split_it/modules/login/login_service.dart';
import 'package:split_it/modules/login/login_state.dart';
import 'package:split_it/modules/login/models/user_model.dart';

class LoginServiceMock extends Mock implements LoginService {}

void main() {
  late LoginController controller;
  late LoginService service;

  setUp(() {
    service = LoginServiceMock();
    controller = LoginController(service: service, onUpdate: () {});
  });

  test("Testing Google sign in return success", () async {
    expect(controller.state, isInstanceOf<LoginStateEmpty>());

    final states = <LoginState>[];
    controller.listen((state) => states.add(state));

    when(service.googleSignIn).thenAnswer(
        (_) async => UserModel(id: "1", email: "john.doe@gmail.com"));

    await controller.googleSignIn();

    expect(states[0], isInstanceOf<LoginStateLoading>());
    expect(states[1], isInstanceOf<LoginStateSuccess>());
    expect(states.length, 2);
  });

  test("Testing Google sign in return failure", () async {
    expect(controller.state, isInstanceOf<LoginStateEmpty>());

    final states = <LoginState>[];
    controller.listen((state) => states.add(state));

    when(service.googleSignIn).thenThrow("Error");

    await controller.googleSignIn();

    expect(states[0], isInstanceOf<LoginStateLoading>());
    expect(states[1], isInstanceOf<LoginStateFailure>());
    expect((states[1] as LoginStateFailure).message, "Error");
    expect(states.length, 2);
  });

  test("Testing update method", () async {
    controller.state = LoginStateLoading();
    controller
        .listen((state) => expect(state, isInstanceOf<LoginStateLoading>()));
    controller.update();
  });
}
