import 'package:flutter/cupertino.dart';
import 'package:split_it/modules/home/home_state.dart';
import 'package:split_it/modules/home/repositories/home_repository.dart';
import 'package:split_it/modules/home/repositories/home_repository_mock.dart';

class HomeController {
  late HomeRepository homeRepository;

  HomeState state = HomeStateEmpty();

  HomeController() {
    this.homeRepository = HomeRepositoryMock();
  }

  getEvents(VoidCallback onUpdate) async {
    state = HomeStateLoading();
    final response = await homeRepository.getEvents();
    state = HomeStateSuccess(events: response);
    onUpdate();
  }
}
