class Laser {
  int x, y, speed, r;
  color c;
  PImage laser;
  int damage;

  //Constructor
  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    speed = 8;
    r = 5;
    c = color(#18FF0D);
    damage = int(random(10,20));
    laser = loadImage("Greenlaser.png");
  }

  //fire method
  void fire() {
    y-=speed;
  }

  //displaymethod
  void display() {
    imageMode(CENTER);
    image(laser,x,y);
  }
  
  //reached top
  boolean reachedTop() {
    if(y<-50){
      return true;
    } else {
      return false;
    }
  }
  
}
