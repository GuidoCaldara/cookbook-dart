import "controller.dart";
import 'repository.dart';
import 'router.dart';

void main() async {
  Cookbook repository = new Cookbook("recipes.csv", []);
  await repository.readFromCsv();
  Controller controller = new Controller(repository);
  Router router = new Router(controller);
  router.start();
}