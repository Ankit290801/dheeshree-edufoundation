// ignore_for_file: no_logic_in_create_state, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:edufoundation_app/constants/databaseLinks.dart';
import 'package:edufoundation_app/services/apiCall.dart';
import 'package:edufoundation_app/utils/questions.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Questions extends StatefulWidget {
  final String subjectName;
  
  final String chapterName;

  final String difficulty;

  final int time;

  final int noOfQues;

  const Questions({ Key? key, required this.subjectName, required this.chapterName, required this.difficulty, required this.time, required this.noOfQues }) : super(key: key);

  @override
  State<Questions> createState() => _QuestionsState(
    subjectName: subjectName, 
    chapterName: chapterName,
    time: time,
    noOfQues: noOfQues,
    difficulty: difficulty
  );
}

class _QuestionsState extends State<Questions> {

  String subjectName;
  String chapterName;
  int time;
  int noOfQues;
  String difficulty;

  _QuestionsState({required this.subjectName, required this.chapterName, 
  required this.difficulty, required this.time, required this.noOfQues});

  late Duration duration = Duration(seconds: time*60);
  

  Timer? timer;
  @override
  void initState(){
    super.initState();
    getQ();
    startTimer();
  }

  List<Question> _questions = [];

  void getQ() async {
    _questions = await ac.getQuestions(subjectName, chapterName, noOfQues, difficulty);
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  reduceTime(){
    const reduceSeconds = 1;

    setState((){
      final seconds = duration.inSeconds - reduceSeconds;

      duration = Duration(seconds: seconds);
    });
    
    if(duration.inSeconds == 0){
      Fluttertoast.showToast(  
        msg: 'Practice Session Completed',  
        toastLength: Toast.LENGTH_SHORT,  
        gravity: ToastGravity.BOTTOM,  
        backgroundColor: Colors.lightGreen,  
        textColor: Colors.white  
      );  
      Navigator.pop(context);
    }
  }

  startTimer(){
    timer = Timer.periodic(Duration(seconds: 1), (_) => reduceTime());
  }

  Widget showTimer(){
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours.remainder(60));
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Text(
      "$hours:$minutes:$seconds",
      style: TextStyle(
        fontSize: 20.0,
        letterSpacing: 1.2
      ),
    );
  }
  
  ApiCall ac = new ApiCall();

  bool showHint = false;
  bool showAnswer = false;


  int quesIndex = 0;

  void prevQuestion(){
      setState(() {
        quesIndex--;
      });
    }

  void nextQuestion(){
    setState((){
      quesIndex++;
    });
  }

  Future<bool> _handlePop() async {
    return (
      await showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: Text("Are You Sure?"),
          content: Text("Do you want to quit the practice session"),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.of(context).pop(true);
              }, 
              child: Text("Yes")
            ),
            TextButton(
              onPressed: (){
                Navigator.of(context).pop(false);
              }, 
              child: Text("No")
            )
          ],
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: _handlePop,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            chapterName,
            
          ),
          actions: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: showTimer()
              )
            ),
          ],
        ),
    
        //UI to display for questions
        body: _questions.isEmpty ? 
          Center(
            child: Text("Loading Questions..."),
          )
          :
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Question ${quesIndex+1}.",
                  style: TextStyle(
                    color: Color.fromARGB(255, 22, 22, 22),
                    letterSpacing: 1.2,
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 15,),
                _questions[quesIndex].ques == "" ? 
                Image.network(
                  _questions[quesIndex].quesImg
                )
                :
                Text(
                  _questions[quesIndex].ques,
                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 1.2,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: (){}, 
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 231, 229, 229)),
                    foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 22, 22, 22))
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "a. ${_questions[quesIndex].op1}",
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                ElevatedButton(
                  onPressed: (){}, 
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 231, 229, 229)),
                    foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 22, 22, 22))
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "b. ${_questions[quesIndex].op2}"
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                ElevatedButton(
                  onPressed: (){
    
                  }, 
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 231, 229, 229)),
                    foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 22, 22, 22))
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "c. ${_questions[quesIndex].op3}"
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                ElevatedButton(
                  onPressed: (){
                    
                  }, 
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 231, 229, 229)),
                    foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 22, 22, 22))
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "d. ${_questions[quesIndex].op4}"
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: (){
                        setState(() {
                          showHint = !showHint;
                        });
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                        foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 22, 22, 22))
                    ),
                      child: Text(
                        "Hint",
                      ),
                    ),
                    TextButton(
                      onPressed: (){
                        setState(() {
                          showAnswer = !showAnswer;
                        });
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                        foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 22, 22, 22))
                    ),
                      child: Text(
                        "Show Answer",
                      ),
                    ),
                  ]
                ),
                SizedBox(height: 20),
                showHint ?
                Center(
                  child: Text(
                    // _questions[quesIndex].hint
                    "This is the Hint Text",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ) 
                :
                Container(),
                showAnswer ?
                Center(
                  child: Text(
                    // _questions[quesIndex].hint
                    "This is the Answer for the question",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ) 
                :
                Container(),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    quesIndex>0 ?
                    IconButton(
                      onPressed: (){
                        prevQuestion();
                      }, 
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.grey
                      ),
                    ) : Container(),
                    quesIndex < _questions.length-1 ? 
                    IconButton(
                      onPressed: (){
                        nextQuestion();
                      }, 
                      icon: Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.grey
                      ),
                    ) : 
                    Container()
                  ],
                ),
              ],
            ),
          )
      ),
    );
  }
}


// final _questions = [
//   {
//     'ques':'Adipisicing amet voluptate excepteur cillum.',
//     'op1' : 'Adipisicing',
//     'op2' : 'voluptate',
//     'op3' : 'excepteur',
//     'op4' : 'cillum',
//   },
//   {
//     'ques':'Dolor ad pariatur enim excepteur dolor excepteur fugiat ut eiusmod ipsum et minim dolor occaecat.',
//     'op1' : 'pariatur',
//     'op2' : 'excepteur',
//     'op3' : 'eiusmod',
//     'op4' : 'fugiat',
//   },
//   {
//     'ques':'Tempor velit commodo ipsum fugiat laboris excepteur nostrud elit deserunt qui consequat consequat.',
//     'op1' : 'deserunt',
//     'op2' : 'ipsum',
//     'op3' : 'Tempor',
//     'op4' : 'commodo',
//   }
// ];