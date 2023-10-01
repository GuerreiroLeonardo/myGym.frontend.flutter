import '../../domain/models/ui/log.model.dart';
import '../../domain/models/ui/slider.model.dart';
import '../constants/images.dart';

List<LogModel> getList() {
  List<LogModel> list = [];
  LogModel model = LogModel();
  model.name = "Lower Body";
  model.Image = t6_ic_work1;
  model.type = "Beginner";
  model.info = "7 * 4 Challence";

  LogModel model1 = LogModel();
  model1.name = "Chest Intermediate";
  model1.info = "7 * 4 Challence";
  model1.type = "Intermediate";
  model1.Image = t6_ic_work2;

  LogModel model2 = LogModel();
  model2.name = "ABS Advanced";
  model2.info = "7 * 4 Challence";
  model2.type = "Advanced";
  model2.Image = t6_ic_work3;

  LogModel model3 = LogModel();
  model3.name = "Incline Dumbbell Fly";
  model3.info = "7 * 4 Challence";
  model3.type = "Intermediate";
  model3.Image = t6_ic_work1;

  LogModel model4 = LogModel();
  model4.name = "Lower Body";
  model4.info = "7 * 4 Challence";
  model4.type = "Beginner";
  model4.Image = t6_ic_work2;

  list.add(model);
  list.add(model1);
  list.add(model3);
  list.add(model2);
  list.add(model4);

  return list;
}

List<SliderModel> getSliders() {
  List<SliderModel> list = [];
  SliderModel model1 = SliderModel();
  model1.name = "Treino A";
  model1.Image = t6_ic_work1;
  model1.info = "Back";
  model1.duration = "12 min";

  SliderModel model2 = SliderModel();
  model2.name = "Treino B";
  model2.Image = t6_ic_work2;
  model2.info = "Legs";
  model2.duration = "10 min";

  SliderModel model3 = SliderModel();
  model3.name = "Treino C";
  model3.Image = t6_ic_work1;
  model3.info = "Triceps + Biceps";
  model3.duration = "12 min";

  list.add(model1);
  list.add(model2);
  list.add(model3);
  return list;
}

List<LogModel> getData() {
  List<LogModel> list = [];
  LogModel model = LogModel();
  model.name = "Cycle";
  model.Image = t6_ic_cycle;

  LogModel model1 = LogModel();
  model1.name = "Run";
  model1.Image = t6_ic_running;

  LogModel model2 = LogModel();
  model2.name = "Walk";
  model2.Image = t6_ic_walk;

  LogModel model3 = LogModel();
  model3.name = "Swim";
  model3.Image = t6_ic_swim;

  LogModel model4 = LogModel();
  model4.name = "Gym";
  model4.Image = t6_ic_swim;

  LogModel model5 = LogModel();
  model5.name = "Boxing";
  model5.Image = t6_ic_boxing;

  LogModel model6 = LogModel();
  model6.name = "Zumba";
  model6.Image = t6_ic_zumba;

  list.add(model);
  list.add(model1);
  list.add(model3);
  list.add(model2);
  list.add(model4);
  list.add(model5);
  list.add(model6);

  return list;
}
