import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import '../Widget/cat.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  HomeState createState()=> HomeState();
}

class HomeState extends State<Home> with TickerProviderStateMixin{

 late  Animation<double> catAnimation;
 late  AnimationController catController;

  @override
  initState(){
    super.initState();
    catController =AnimationController(
      duration:  const Duration(microseconds: 200),
      vsync:this
    );
    catAnimation=Tween(begin: -35.0, end :-80.0)
    .animate(
      CurvedAnimation(
        parent: catController,
         curve: Curves.easeIn
         ),
    );
    
  }
onTap(){
  if(catController.status==AnimationStatus.completed ){
    catController.reverse();
  }
  else if(catController.status==AnimationStatus.dismissed)
  {
    catController.forward();
  }
   
}   
@override
  Widget build(context){
    return Scaffold(
        appBar: AppBar(
          title: const Text('Animation'),
        ),
    body: GestureDetector(
      onTap: onTap,
      child: Center(
        child: Stack(
        clipBehavior: Clip.none,
        children:[
         
            buildCatAnimation(),
             buildbox(),
            
            

        ],
      ) ,
      ),
      
      ),
 


    );
  }
  Widget buildCatAnimation(){
    return AnimatedBuilder(
      animation: catAnimation,
       builder: (context,child){
          return Positioned(
              top:catAnimation.value,
              right: 0.0,
              left: 0.0,
               child: child!,
             //child: child,
           
          );
       },
       child:Cat(),
       );

  }
  Widget buildbox(){
    
    return  Container(
     height: 200.0,
     width: 200.0,
     color: Colors.brown, 
    );
  }  

}
