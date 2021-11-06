import 'algorithm.dart';
import 'barrel.dart';
import 'models.dart';

void main() {
  List<Circuit> testList = algorithm(5, MuscleGroup.abs, Difficulty.easy);
  if (testList.isEmpty)
    print("List is empty");
  else
    print(testList.toString());
}
