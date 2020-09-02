class Rock {
  //Member Variables
  int x, y, w, h;
  float health;
  PImage rock;
  int rand;
  float speed;
  boolean isPU;

  //Constructor
  Rock(int x, int y) {
    this.x = x;
    this.y = y;
    w = 100;
    h = 100;
    health = 100;
    speed = random(1, 9);
    rand = int(random(1, 4));
    if (random(100)>95) {
      rock = loadImage("Powerup.png");
      isPU = true;
    } else {
      isPU = false;
      if (rand == 1) {
        rock = loadImage("Rock.png");
      } else if (rand == 2) {
        rock = loadImage("Rock2.png");
      } else if (rand == 3) {
        rock = loadImage("Rock3.png");
      }
    }
  }

  void display() {
    if (isPU) {
      imageMode(CENTER);
      image(rock, x, y);
    } else {
      image(rock, x, y);
    }
  }

  void move() {
    y+=speed;
  }

  boolean reachedBottom() {
    if (y>height+50) {
      return true;
    } else {
      return false;
    }
  }
}
