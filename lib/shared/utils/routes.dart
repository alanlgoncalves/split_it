enum Routes { splash, login, error, home, create_split, event_details }

extension RoutesExtension on Routes {
  String get route {
    switch (this) {
      // Add specifics routes patterns cases
      default:
        return "/${this.toString().split(".")[1]}";
    }
  }
}
