//this timer class was taken from a youtube video the link would be on the attached sheet of references 

class Timer{
  int startTime;
  int interval;
  
  Timer(int timeInterval){
    interval=timeInterval;
  }
  void start(){
    startTime=millis();
  }
  boolean complete(){
    int elapsedTime=millis()-startTime;
    if(elapsedTime > interval){
      return true;
    }else{
      return false;
    }
  }
}
  
