import 'dart:io';

void main() {
  performTask();
}

void performTask() async {
  task1();
  String task2data = await task2();
  task3(task2data);
}

void task1() {
  print('Task 1 completed');
}

Future<String> task2() async {
  Duration threeSeconds = Duration(seconds: 3);
  String task2String = ' no Data';
  await Future.delayed(threeSeconds, () {
    task2String = 'task2String';
    print('Task 2 completed');
  });

  return task2String;
}

void task3(String task2data) {
  print('Task 3 completed and data is' + task2data);
}
