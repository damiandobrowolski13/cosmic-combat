class Laser{
  float xPos;
  float yPos;
  int speed;
  int size;
  color col;
  boolean fired;
 
  Laser(float xPos_, float yPos_, int speed_, int size_, color col_, boolean fired_){
    xPos = xPos_;
    yPos = yPos_;
    speed = speed_;
    size = size_;
    col = col_;
    fired = fired_;
  }
 
  void display(){
    fill(col);
    rect(xPos, yPos, size/5, size);
  }
 
  void move(){
    yPos-=speed;
  }
}
