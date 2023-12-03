Fighter fighter;
Laser laser;
ArrayList <Laser> lasers;
ArrayList <Laser> stars;
ArrayList <Laser> rays;
ArrayList <Bugger> buggers;
float y = -50;
int score;

void setup(){
  size(800,800);
  fighter = new Fighter(mouseX,mouseY,1,false);
  buggers = new ArrayList <Bugger> ();
  stars = new ArrayList <Laser> ();
}

void draw(){
  background(0);
  fill(0,255,0);
  textSize(50);
  y+=10;
  text("Welcome to Cosmic Combat", 100, y);    //welcome message
  textSize(30);
  fill(255);
  text("Spacebar to shoot", 275, y+40);     //instructions
  textSize(20);
  text("Score: " + score, 700, 30);          //score
  fighter.display();
  fighter.fire();
  for (int i = 0; i < 5; i++){                      //creates 5 buggers
    buggers.add(new Bugger(i*150+50,-500,5,1));
    buggers.get(i).display();
    buggers.get(i).move();
    buggers.get(i).hit(lasers);
    buggers.get(i).die();
    if (buggers.get(i).yPos > 800){              //resets buggers' position if off screen
      buggers.get(i).yPos = -100;
    }
  }
  //fighter.hit(rays);
  //fighter.checkDead();
  for (int i = 0; i < 2000; i++){        //uses laser class to create movement effect of flying past stars
    stars.add(new Laser(random(width), random(-100, 800), -30, 15, color(255, random(150)), true));
    stars.get(i).display();
    stars.get(i).move();
    if (stars.get(i).yPos > 800){
      stars.get(i).yPos = random(-500);    //moves stars back up screen if they go off (random so they don't all spawn at same point and come back down in a line)
    }
  }
}
