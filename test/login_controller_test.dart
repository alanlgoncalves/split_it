import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart' as mobx;
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
    controller = LoginController(service: service);
  });

  test("Testing Google sign in return success", () async {
    expect(controller.state, isInstanceOf<LoginStateEmpty>());

    final states = <LoginState>[];

    mobx.autorun((state) {
      states.add(controller.state);
    });

    when(service.googleSignIn).thenAnswer(
        (_) async => UserModel(id: "1", email: "john.doe@gmail.com"));

    await controller.googleSignIn();

    expect(states[0], isInstanceOf<LoginStateEmpty>());
    expect(states[1], isInstanceOf<LoginStateLoading>());
    expect(states[2], isInstanceOf<LoginStateSuccess>());
    expect(states.length, 3);
  });

  test("Testing Google sign in return failure", () async {
    expect(controller.state, isInstanceOf<LoginStateEmpty>());

    final states = <LoginState>[];
    mobx.autorun((state) {
      states.add(controller.state);
    });

    when(service.googleSignIn).thenThrow("Error");

    await controller.googleSignIn();

    expect(states[0], isInstanceOf<LoginStateEmpty>());
    expect(states[1], isInstanceOf<LoginStateFailure>());
    expect((states[1] as LoginStateFailure).message, "Error");
    expect(states.length, 2);
  });

  test("Testing listen method", () async {
    controller.state = LoginStateLoading();

    mobx.autorun(
        (_) => {expect(controller.state, isInstanceOf<LoginStateLoading>())});
  });
}
