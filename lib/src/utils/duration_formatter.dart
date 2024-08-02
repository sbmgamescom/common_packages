class DurationFormatter {
  static String durationToString(Duration duration) {
    String hours = (duration.inHours % 24).toString().padLeft(2, '0');
    String minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');

    String formattedTime = '$hours:$minutes:$seconds';

    if (duration.inDays > 0) {
      return '${duration.inDays} days $formattedTime';
    } else {
      return formattedTime;
    }
  }

  static String toHoursMinutes(Duration duration) {
    String hours = duration.inHours.toString().padLeft(2, '0');
    String minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');

    return '$hours:$minutes';
  }

  static String toMinutesSeconds(Duration duration) {
    String minutes = duration.inMinutes.toString().padLeft(2, '0');
    String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');

    return '$minutes:$seconds';
  }
}
