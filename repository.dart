import 'dart:io';
import 'dart:async';
import 'recipe.dart';
import 'package:csv/csv.dart';
import 'dart:convert'; // Contains the `Utf8Decoder` and `LineSplitter` stream transformers



class Cookbook{
  List recipes;
  String filepath;  
  Cookbook(this.filepath, this.recipes);

  all() { 
    return this.recipes; 
  } 

  add(recipe){
    this.recipes.add(recipe);
    writeToCsv();
  }

  delete(int index){
    this.recipes.removeAt(index);
    writeToCsv();
  }

  Future readFromCsv() async {
    var file = File(filepath);
    if (await file.exists()) {
      var contents = await file.readAsString();
      LineSplitter ls = new LineSplitter();
      List<String> lines = ls.convert(contents);
      lines.forEach((recipe){
        this.recipes.add(new Recipe(recipe.split(",")[0], recipe.split(",")[1]));
      });
    }
  }

  writeToCsv() async {
    var file = File(filepath);
    if (await file.exists()) {
      var list = this.recipes.map((recipe){
        return [recipe.name, recipe.description ];
      }).toList();
      final res = const ListToCsvConverter().convert(list);
      var csv = await File('recipes.csv');
      csv.writeAsString(res);
    }
  }
}


    