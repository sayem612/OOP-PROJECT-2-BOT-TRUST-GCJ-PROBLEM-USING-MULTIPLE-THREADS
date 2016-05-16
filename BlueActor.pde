/** This Thread acts for the blueRobot*/
public class BlueActor extends Thread{
  @Override
  public void run(){
   

     //drawing the button pressed by the Blue Robot
  if((BlueButtonPressed.size()-1)!=-1){

    if(blueCaseCheck==caseNum){
  BlueButtonPressed.add(ButtonClicked(blueRobot));

  }
  else{
    BlueButtonPressed.clear();
    BlueButtonPressed.add(zero2);
    blueCaseCheck=caseNum;
  }
  }
  
   

  

}}