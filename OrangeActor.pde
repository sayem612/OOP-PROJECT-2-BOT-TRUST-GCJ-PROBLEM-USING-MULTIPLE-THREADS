/** This Thread acts for the OrangeRobot*/
public class OrangeActor extends Thread{
  @Override
  public void run(){
      
//drawing the button pressed by the Orange Robot
   if((OrangeButtonPressed.size()-1)!=-1){

   if(orangeCaseCheck==caseNum && (ButtonClicked(orangeRobot)!=null)){
  OrangeButtonPressed.add(ButtonClicked(orangeRobot));
  
  }
  else{
    OrangeButtonPressed.clear();
    OrangeButtonPressed.add(zero1);
    orangeCaseCheck=caseNum;
  }  
  }
 
}
  }