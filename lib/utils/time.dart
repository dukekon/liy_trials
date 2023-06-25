/// 关于控制时间的工具类
class TimeControl {
  /// 为个位数时间补零
  /// [time] 时间
  static String format(int time) {
    return time < 10 ? '0$time' : '$time';
  }
}
