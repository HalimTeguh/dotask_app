import 'package:isar/isar.dart';


// run this command: flutter pub run build_runner build
part 'task.g.dart';

@Collection()
class Task {
  Id id = Isar.autoIncrement; 

  late String task;
  late bool idDone = false;
}