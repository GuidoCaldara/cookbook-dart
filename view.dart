import 'dart:io';

class View{
  ask_for_name(){
    print("Enter the name: ");
    String name = stdin.readLineSync();
    return name;
  }


  ask_for_description(){
    print("Enter the description: ");
    String description = stdin.readLineSync();
    return description;
  }
  ask_for_index(){
    print("Which one do you want delete?(Insert the number)");
    int index = int.parse(stdin.readLineSync());
    return index - 1;
  }

  ask_for_query(){
    print("Enter an ingredient: ");
    return stdin.readLineSync();
  }

    list(recipes){
      print("---------------------------------------------");
      print("Recipes List");
      for(int i = 0; i < recipes.length; i++){
        print("${i + 1} - ${recipes[i].name}");
      }
      print("---------------------------------------------");
  }
}