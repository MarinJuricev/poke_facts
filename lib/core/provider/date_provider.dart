abstract class DateProvider {
  DateTime generate();
}

class SystemDateProvider implements DateProvider {
  @override
  DateTime generate() => DateTime.now();
}
