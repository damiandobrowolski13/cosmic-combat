class Bugger{
  float xPos;
  float yPos;
  int speed;
  int health;
  PImage img2;
  ArrayList <Laser> rays;
 
  Bugger(float xPos_, float yPos_, int speed_, int health_){
    xPos = xPos_;
    yPos = yPos_;
    speed = speed_;
    health = health_;
    img2 = loadImage("Bugger.jpg");
    img2.resize(100,100);
    rays = new ArrayList <Laser> ();
  }
 
  void display(){
    image(img2, xPos, yPos);
    for (int i = 0; i < 1; i++){
      rays.add(new Laser(xPos+45, yPos-350, -10, 40, color(255, 0, 0), true));
      rays.get(i).display();
      rays.get(i).move();
    }
  }
 
  void move(){
    yPos+=speed;
  }
  
  void hit(ArrayList <Laser> lasers){            //checks if bugger has made contact with laser and decreases health if so
    for (int i = 0; i < lasers.size(); i++){
      for (int j = 0; j < buggers.size(); j++){
        if ((abs(lasers.get(i).xPos - (buggers.get(j).xPos + 50)) <= 40) && (abs(lasers.get(i).yPos - (buggers.get(j).yPos + 10)) <= 40)){
          buggers.get(j).health--;
          for (int k = i; k < lasers.size(); k++){    //moves lasers that have been shot off screen if they kill a bugger (to stop spamming of lasers)
            lasers.get(k).xPos += 1000;
          }
        }
      }
    }
  }
  
  void die(){                                    //removes bugger if health is 0
    for (int i = 0; i < buggers.size(); i++){
      if (buggers.get(i).health == 0){
        buggers.remove(i);
        score++;                                  //increases score if bugger removed
      }
    }
  } 
}
    
 
