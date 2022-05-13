import 'dart:convert';

import 'package:edufoundation_app/constants/databaseLinks.dart';
import 'package:edufoundation_app/utils/chapters.dart';
import 'package:edufoundation_app/utils/questions.dart';
import 'package:http/http.dart' as http;

class ApiCall {
  Future<List<Chapter>> getChapters(String subjectName) async {

    const String url = chapterLink;
    
      var response = await http.get(Uri.parse(url+subjectName));
      var responseBody = json.decode(response.body);
      var responseChapters = responseBody['result'];
      List<Chapter> chapters = [];
      for(var chapter in responseChapters){
        Chapter ch = Chapter(chapter['name']);
        chapters.add(ch);
      }
    return chapters;  
  }  

  Future<List<Question>> getQuestions(String subjectName, String chapterName) async {
         
    const String url = questionLink;
    
      var response = await http.get(Uri.parse(url+"$subjectName/:$chapterName?page=1&limit=10"));
      var responseBody = json.decode(response.body);
      var responseQuestions = responseBody['result'];
      List<Question> questions = [];
      for(var question in responseQuestions){
        Question q = Question(question['question'], question['option1'], question['option2'], 
          question['option3'], question['option4'], question['correct_answer'], question['hints']);
        questions.add(q);
      }
    return questions;  
  }  

}