import "controller.dart";
import 'dart:io';

class Router{
  Controller controller;

  Router(Controller controller){
    this.controller = controller;
  }

  start(){
    bool condition = true;
    print("Welcome to the cookbook");
    while (condition){
      int choiche = askUser();
      if (choiche == 5 ) condition = false;
      switch(choiche) { 

        case 1: { this.controller.all(); } 
        break; 

        case 2: { this.controller.add(); } 
        break; 

        case 3: { this.controller.destroy(); } 
        break; 
      } 
    }
  }

  askUser(){
    print("Choose an option");
    print("1 - List the recipes");
    print("2 - Add a recipe");
    print("3 - Remove a recipe");
    print("5 - Quit");
    return int.parse(stdin.readLineSync());
  }
}



