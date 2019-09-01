import "repository.dart";
import "recipe.dart";
import "view.dart";

class Controller{
  Cookbook cookbook;
  View view = new View();
  Controller(Cookbook cookbook){
    this.cookbook = cookbook;
  }

  all(){
    List recipes = cookbook.all();
    view.list(recipes);
  }

  add(){
    String name = view.ask_for_name();
    String description = view.ask_for_description();
    Recipe recipe = new Recipe(name, description);
    this.cookbook.add(recipe);
  }

  destroy(){
    List recipes = cookbook.all();
    view.list(recipes);
    int index = view.ask_for_index();
    this.cookbook.delete(index);
  }
}