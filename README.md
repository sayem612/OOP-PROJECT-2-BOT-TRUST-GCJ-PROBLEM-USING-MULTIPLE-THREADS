# OOP-PROJECT-2-BOT-TRUST-GCJ-PROBLEM-USING-MULTIPLE-THREADS
#CHECK THE SIMULATION IMAGES GIVEN FOR CASE# 6,11,20
CISC 3150 OBJECT ORIENTED PROGRAMMING 
##Project Requirement
 Project 2

Many of the Google Code Jam problems, such as games, racing cars, and robots, can be solved by using simulation. For example, the Bot Trust problem can be solved by simulating how robots push the buttons; the Graduation Requirements problem can be solved by simulating how the car can drive without meeting with any other car when starting at a different intersection at a different time. Choose one from the practice problems and write a simulator in Java or C++ for solving the problem. Your simulator must meet the following requirements:

    It must correctly simulate a solution for the small data set.
    It must provide a GUI that visualizes the solution.
    It should use multiple threads to simulate multiple actors if there are multiple actors involved. 

Please make your project available on a web site, such as GitHub or SourceForge, and email a link to the page with the subject "Project-2: Name" to: cisc3150@picat-lang.org. All projects that meet the minimum requirements will receive 15 points. Outstanding projects will be awarded 5 extra points. 


## BOT TRUST (GCJ QUESTION)
#Solution done by: Kazi Ullah

Problem link: https://code.google.com/codejam/contest/975485/dashboard
Problem A Bot Trust
Problem

Blue and Orange are friendly robots. An evil computer mastermind has locked them up in separate hallways to test them, and then possibly give them cake.

Each hallway contains 100 buttons labeled with the positive integers {1, 2, ..., 100}. Button k is always k meters from the start of the hallway, and the robots both begin at button 1. 
Over the period of one second, a robot can walk one meter in either direction, or it can press the button at its position once, or it can stay at its position and not press the button. 
To complete the test, the robots need to push a certain sequence of buttons in a certain order. Both robots know the full sequence in advance. How fast can they complete it?

For example, let's consider the following button sequence:

   O 2, B 1, B 2, O 4
   
Here, O 2 means button 2 in Orange's hallway, B 1 means button 1 in Blue's hallway, and so on. 
The robots can push this sequence of buttons in 6 seconds using the strategy shown below: 


Time | Orange           | Blue
-----+------------------+-----------------
  1  | Move to button 2 | Stay at button 1
  2  | Push button 2    | Stay at button 1
  3  | Move to button 3 | Push button 1
  4  | Move to button 4 | Move to button 2
  5  | Stay at button 4 | Push button 2
  6  | Push button 4    | Stay at button 2
  
  Note that Blue has to wait until Orange has completely finished pushing O 2 before it can start pushing B 1.

Input

The first line of the input gives the number of test cases, T. T test cases follow.

Each test case consists of a single line beginning with a positive integer N, representing the number of buttons that need to be pressed. 
This is followed by N terms of the form "Ri Pi" where Ri is a robot color (always 'O' or 'B'), and Pi is a button position.
Output

For each test case, output one line containing "Case #x: y", where x is the case number (starting from 1) and y is the minimum number
of seconds required for the robots to push the given buttons, in order.
Limits

1 ≤ Pi ≤ 100 for all i.
Small dataset

1 ≤ T ≤ 20.
1 ≤ N ≤ 10.
Large dataset

1 ≤ T ≤ 100.
1 ≤ N ≤ 100.

Sample

Input
3

4 O 2 B 1 B 2 O 4

3 O 5 O 8 B 100

2 B 2 B 1



Output

Case #1: 6

Case #2: 100

Case #3: 4                                      */



## What will be used to solve the problem
I will be using Processing. 

### What is Processing?
Processing is an open source programming language and integrated development environment (IDE) built for the electronic arts, new media art, and visual design communities with the purpose of teaching the fundamentals of computer programming in a visual context, and to serve as the foundation for electronic sketchbooks. 
For more information go to: https://en.wikipedia.org/wiki/Processing_%28programming_language%29

#INORDER TO RUN THIS IN YOUR DEVICE
Change the file path(change directories) in the BotTrust() method  which is using FileInputStream and FileOutputStream for input output.
##CHECK THE VIDEO FOR THE SIMULATION OF THIS PROLEM* 
#SOLUTION TO THE PROBLEM USING SIMULATION: (SOURCE CODE)

import static java.lang.Math.abs;

import static java.lang.Math.min;

import static java.lang.Math.max;

 import java.io.FileInputStream;

 import java.io.FileNotFoundException;

 import java.io.FileOutputStream;

 import java.io.BufferedReader;

 import java.io.BufferedInputStream;

 import java.io.PrintStream;

import java.text.CharacterIterator;

import java.text.StringCharacterIterator;

import java.util.ArrayList;

import java.util.List;

 import java.util.Scanner;

int  min_x=0;

int min_y=0;

int max_x=1560;

int max_y=800;

int grid_size=15;

PVector orangeRobot;  //This is the ORANGE ROBOT

PVector blueRobot;    //This is the BLUE ROBOT

 ArrayList<String> positionX= new ArrayList<String> ();

 //The following ArrayLists are to keep track of the buttons pressed

 ArrayList<PVector> OrangeButtonPressed= new ArrayList<PVector>(); //arraylist of button pressed by the orange robot, empty list intially for each case
 
 ArrayList<PVector> BlueButtonPressed= new ArrayList<PVector>();   //arraylist of button pressed by the blue robot, empty list initially for each case
 
 PFont f;//STEP 1 declare font
 
 int caseNum=0;  //This integer variable is to store the working case number
 
 int orangeCaseCheck=0;//this variable checks caseNum  for maintaining arraylist of button pressed by the orange robot for each caseNum 
 
 int blueCaseCheck=0;///this variable checks caseNum  for maintaining arraylist of button pressed by the blue robot for each caseNum 
 
 PVector zero1;
 
 PVector zero2;
 
 int time=0;
 
 boolean Running;//This variable is used to determine if to run the simulation or stop(pause)

void settings()

{

  size(max_x, max_y);

}

void setup(){

  f = createFont("Arial",16,true); // STEP 2 Create Font

  ellipseMode(CORNER);

  frameRate(4);

  orangeRobot=new PVector(30, 60);

  blueRobot= new PVector(30,120);
  

  positionX= botTrust();

  Running=true;
  

zero1= new PVector(0,0);

zero2= new PVector(15,0);

 OrangeButtonPressed.add(zero1);

 BlueButtonPressed.add(zero2);
 
}

void draw(){

  background(#ffffff);

  fill(#00FF00);

    rect( 30,60, 1515, grid_size);

     rect( 30,120, 1515, grid_size);

   for ( int x=min_x; x<=max_x; x+=grid_size ) {

   
    line( x,min_y,x,max_y );

  }
  
  for ( int y=min_y; y<=max_y; y+=grid_size ) {
  
    line( min_x,y,max_x,y );
  
  }
 
 /** DRAWING FOR ORANGE ROBOT */
 
   drawRobotNButtons(orangeRobot, OrangeButtonPressed,#ffa500);
   
  /** DRAW FOR BLUE ROBOT */
 
   drawRobotNButtons(blueRobot, BlueButtonPressed,#0000ff);
 
   
   
   
   if(Running==true) {
 
   /**Function call to determine location based on the data read from the chart*/
 
   presentPositions();  //
 
   /** CALL THREADS _ACTORS to press the button by each of the Robot (use of MultipleThreads)*/

  Thread  orange = new Thread( new OrangeActor());

  Thread  blue   = new Thread( new BlueActor());

   orange.start();

   blue.start();


   
   }

   /** Data on the sketch*/

   textFont(f,24);  // STEP 3 Specify font to be used

   fill(#FFFF00);

   rect(600,550, 400,150);

  fill(0);                         //STEP 4 Specify font color 

  text( "Case#"+ (caseNum) + " Total Run Time: " + time ,600,600);   // STEP 5 Display Text

  text( "This time Orange at Button: "+(int)(orangeRobot.x/15-2),600,640);   

  text( "This time Blue at Button: "+(int)(blueRobot.x/15-2),600,680);  

   
}


/** Press any key to pause the simulation*/

void keyPressed(){

  if (keyPressed==true){

    if(Running==true){

      Running=false;

    }

    else{

      Running=true;

    }

  }

}



/** This function is to test if the robots are moving */ 

void NewMove(){

if (orangeRobot.x<(max_x-15)){

  orangeRobot.x+=grid_size;

  orangeRobot.y=60;

}
  if (blueRobot.x<(max_x-15)){

blueRobot.x+=grid_size;

blueRobot.y=120;

  }

}





/** This function collects the postions data for the robots from the data file and return a list with that information*/

ArrayList<String> botTrust() {

  ArrayList<String> orangeBlueX= new ArrayList<String>();

    try{

     
      System.setIn( new FileInputStream("C:/Users/Kazi/Desktop/Bot_Trust/A-small-practice.in"));
     
      System.setOut(new PrintStream(new FileOutputStream("C:/Users/Kazi/Desktop/Bot_Trust/A-small-practice.out")));
     
      
      Scanner in = new Scanner(System.in);
     
      int tests = in.nextInt(); in.nextLine();
     
      for (int test=1; test<= tests; test++) {      
     
        int time = 0;
     
        int posOrange = 1, posBlue = 1;
     
        int timeOrange = 0, timeBlue = 0;
        
        int n = in.nextInt();
        
        orangeBlueX.add(Integer.toString(n));
     
        orangeBlueX.add("O");
     
        orangeBlueX.add("30");
     
        orangeBlueX.add("0");
     
        orangeBlueX.add("B");
     
        orangeBlueX.add("30");
     
         orangeBlueX.add("0");
     
       
        for (int i=0; i<n; i++) {
          
         
          if ("O".equals(in.next())) {
             int button = in.nextInt();
     
              int add =  max(1 - timeOrange, abs(button-posOrange) + 1 - timeBlue);
     
             timeOrange += add;
     
            time += add;
     
             timeBlue = 0;
     
            
             posOrange = button;
     
            orangeBlueX.add( "O");
            
            int x1= grid_size*button+30;
     
            orangeBlueX.add(Integer.toString(x1));
            
             orangeBlueX.add(Integer.toString(time));
             
          } 
          
          else {
          
             int button = in.nextInt();
          
              int add =  max(1 - timeBlue, abs(button-posBlue) + 1 - timeOrange);
          
             timeBlue += add;
          
            time += add;
          
            timeOrange = 0;
           
             posBlue = button;
          
             orangeBlueX.add( "B");
          
            int x2= grid_size*button+30;
          
            orangeBlueX.add(Integer.toString(x2));
          
             orangeBlueX.add(Integer.toString(time));
          
          }     
       
        }
        
        
        System.out.println(String.format("Case #%d: %d", test, time));
      
      }
      
    }
        catch(IOException ioe){
    
    System.out.println("Error: " +ioe);
    
    }
  
  return orangeBlueX;

}


/** This functions determines the positions of the Robots based 

on the data collected through the function call for( BotTrust() ) */

int n=0;

void presentPositions(){

if(positionX.isEmpty()==false){

      if(n==0){

  caseNum++;

  n= Integer.parseInt(positionX.get(0))+2;

  positionX.remove(0);

      }

   if(positionX.get(0)=="O"){

     positionX.remove(0);

     orangeRobot.x=Integer.parseInt(positionX.get(0));

     positionX.remove(0);

      n--;

   }

   else if(positionX.get(0)=="B"){

     positionX.remove(0);

     blueRobot.x=Integer.parseInt(positionX.get(0));

     positionX.remove(0);

      n--;

   }

    time=Integer.parseInt(positionX.get(0));

          positionX.remove(0);

   }
  
   
}

/** This function returns the PVector (Button location) 
pressed by the agent passed in the parameter*/

 PVector ButtonClicked(PVector agent){

   if(agent.x==30){ return new PVector();} // this returns a null PVector because that is index and Robot does not press that button 

   PVector PressedButton= new PVector(agent.x, agent.y);

   return PressedButton;    // otherwise it return the PVector

 }
   
   
/** This function is used to draw Present location of the robot 
and the buttons pressed after each case iteration */

void drawRobotNButtons(PVector agent, ArrayList<PVector> buttonPressed, color col){

  for (PVector e: buttonPressed){

     fill(255,0,0);

     rect( e.x, e.y, grid_size, grid_size );

   }

      fill(col);

   ellipse( agent.x, agent.y, grid_size, grid_size );

}




/** This Thread acts for the OrangeRobot*/

public class OrangeActor extends Thread{

  @Override

  public void run(){

      
//drawing the button pressed by the Orange Robot

   if((OrangeButtonPressed.size()-1)!=-1){

   if(orangeCaseCheck==caseNum && (ButtonClicked(orangeRobot)!=null)){

  OrangeButtonPressed.add(ButtonClicked(orangeRobot));
  
  }

  else
 
  {
 
    OrangeButtonPressed.clear();
 
    OrangeButtonPressed.add(zero1);
 
    orangeCaseCheck=caseNum;
 
  }  
 
  }
 
}

  }
  
  
  
  
  
  /** This Thread acts for the blueRobot*/

public class BlueActor extends Thread{

  @Override

  public void run(){
   

     //drawing the button pressed by the Blue Robot

  if((BlueButtonPressed.size()-1)!=-1){

    if(blueCaseCheck==caseNum){

  BlueButtonPressed.add(ButtonClicked(blueRobot));

  }

  else
  {
  
    BlueButtonPressed.clear();
  
    BlueButtonPressed.add(zero2);
  
    blueCaseCheck=caseNum;
  
  }
  
  }

}

}
  
