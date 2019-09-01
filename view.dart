import 'dart:io';

class View{
  ask_for_name(){
    stdout.write("Enter the name: ");
    String name = stdin.readLineSync();
    return name;
  }


  ask_for_description(){
    stdout.write("Enter the description: ");
    String description = stdin.readLineSync();
    return description;
  }
  ask_for_index(){
    stdout.write("Which one do you want delete?(Insert the number)");
    int index = int.parse(stdin.readLineSync());
    return index - 1;
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