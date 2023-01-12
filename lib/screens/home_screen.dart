import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:bmicalculator/screens/bmi_result.dart';
import 'bmi_result.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {

  bool isMale=true;
  double height=120.0;
  int weight=40;
  int age=20;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body:
      Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
               children: [
                 Expanded(
                   child: GestureDetector(
                     onTap: (){
                        setState(() {
                          isMale=true;
                        });
                     },
                     child: Container(
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                        Image(image: AssetImage('images/male.png'),
                          height: 90,
                          width: 90,
                           ),
                           SizedBox(height: 15,),
                           Text(
                             'MALE',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),)
                         ],
                       ),
                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                           color: isMale ? Colors.blue : Colors.grey[400], ),
                     ),
                   ),
                 ),
                 SizedBox(width: 20,),
                 Expanded(
                   child: GestureDetector(
                     onTap: (){
                       setState(() {
                         isMale=false;
                       });
                     },
                     child: Container(
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                         Image(image: AssetImage('images/fema.png'),
                             height: 90,
                             width: 90),
                           SizedBox(height: 15,),
                           Text(
                             'FEMALE',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),)
                         ],
                       ),
                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                           color: isMale? Colors.grey[400]:Colors.blue ),
                     ),
                   ),
                 )
               ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[400]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${height.round()}',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900),),
                        Text(
                          'cm',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),),
                      ],
                    ),
                    Slider(value:height ,
                        max: 220,
                        min: 80,
                        onChanged: (value){
                                setState(() {
                                   height= value;
                                });
                        }
                    ),
                  ],
                ),
              ),
            ),
          ),


          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('WEIGHT',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
                          Text(
                            '$weight',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 50),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },mini: true,child:Icon(Icons.remove,) ),
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },mini: true,child:Icon(Icons.add,))
                            ],
                          )
                        ],

                      ),
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[400]),

                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('AGE',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
                          Text(
                            '$age',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 50),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },heroTag : 'age--',
                                  mini: true,child:Icon(Icons.remove,) ),

                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },mini: true,child:Icon(Icons.add,))
                            ],
                          )
                        ],

                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[400]),

                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.blue,
            child: MaterialButton(onPressed: (){

                double result=weight / pow (height/ 100,2);
             Navigator.push(context,
               MaterialPageRoute(
               builder:(context)=> BMIResult(result.round(), age, isMale)

                  ),
               );
            },height: 60,
              child: Text('CALCULATE',
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),),
          ),
        ],

      ),
    );
  }
}



