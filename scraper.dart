import 'dart:convert'; // Contains the JSON encoder
import 'recipe.dart'; // Contains the JSON encoder
import 'package:http/http.dart'; // Contains a client for making API calls
import 'package:html/parser.dart'; // Contains HTML parsers to generate a Document object
import 'package:html/dom.dart'; // Contains DOM related classes for extracting data from elements
import 'dart:developer'; 
import 'dart:async';


class Scraper{

  Future<List> scrapeRecipes(query) async {
    print("kòlklòkklò");
    List<Recipe> listOfRecipes = List<Recipe>();
    var client = Client();
    Response response = await client.get(
      'http://www.letscookfrench.com/recipes/find-recipe.aspx?aqt=$query'
    );
    var document = parse(response.body);
    List<Element> elements = document.querySelectorAll('.m_contenu_resultat');
    elements.forEach((element){
      String name = element.querySelector(".m_titre_resultat").text.trim();
      String description = element.querySelector(".m_texte_resultat").text.trim();
      listOfRecipes.add(new Recipe(name, description));
    });
    return listOfRecipes;
  }
}


