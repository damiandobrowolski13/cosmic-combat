class Fighter{
  float xPos;
  float yPos;
  int health;
  boolean isDead;
  PImage img;

  Fighter(float xPos_, float yPos_, int health_, boolean isDead_){
    xPos = xPos_;
    yPos = yPos_;
    health = health_;
    isDead = isDead_;
    img = loadImage("Fighter.jpg");
    img.resize(100,100);
    laser = new Laser(xPos, yPos, 10, 20, color(0,255,0), false); //creates first laser so laser.fired can be checked
    lasers = new ArrayList <Laser> ();
  }
 
  void display(){
    image(img, mouseX-50, mouseY-50);
    if (laser.fired == true){                     //allows lasers to display not only when space key is pressed 
      for (int i = 0; i < lasers.size(); i++){
        lasers.get(i).display();
        lasers.get(i).move(); 
        if (lasers.get(i).yPos < -5){    //removes laser from ArrayList when it reaches edge of screen
          lasers.remove(i);
        }
      }
    } 
  }
  
  /*
  void hit(ArrayList <Laser> rays){               //checks if fighter has been hit by ray
    for (int i = 0; i < 1; i++){
      if ((abs(rays.get(i).xPos - mouseX) <= 50) && (abs(rays.get(i).yPos - mouseY) <= 50)){
        health--;                                  //decreases health if fighter is hit
      }
    }
  } 
  
  
  boolean checkDead(){            //checks if fighter's health if 0 and if so sets boolean checking death to true
    if (health == 0){
      isDead = true;
    }
    return isDead;
  }
  */
 
  boolean fire(){
    if (keyPressed == true){  //checks if space bar has been pressed to set variable tracking if laser has been fired to true 
      if (key == ' '){
        laser.fired = true;   //if it has been fired then it adds a laser to the ArrayList
        lasers.add(new Laser(mouseX-2, mouseY-60, 10, 20, color(0,255,0), true)); 
      } 
    }
    return laser.fired;
  }
}
