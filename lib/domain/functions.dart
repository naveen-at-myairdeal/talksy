String getCurrentTimeFormatted() {
  final now = DateTime.now();
  final hour = now.hour > 12 ? now.hour - 12 : now.hour == 0 ? 12 : now.hour;
  final minute = now.minute.toString().padLeft(2, '0');
  final period = now.hour >= 12 ? 'pm' : 'am';
  return '$hour:$minute $period';
}