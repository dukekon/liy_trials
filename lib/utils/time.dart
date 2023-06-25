class TimeControl {
  static String format(int time) {
    return time < 10 ? '0$time' : '$time';
  }
}
