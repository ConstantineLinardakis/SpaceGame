class Enemyship {
  //Member Variables
  int x, y, w, h;
  float health;
  int speed;
  int rand;
  //color c;
  PImage enemyship;

  //Constructor
  Enemyship(int x, int y) {
    this.x = x;
    this.y = y;
    w = 10;
    h = 10;
    health = 50;
    speed = int(random(1,3));
    rand = int(random(1,4));
    if (rand == 1) {
        enemyship = loadImage("RedEnemy.png");
      } else if (rand == 2) {
        enemyship = loadImage("PurpleEnemy.png");
      } else if (rand == 3) {
        enemyship = loadImage("BlueEnemy.png");
      }
  }

  //Display Method
  void display() {
    imageMode(CENTER);
    image(enemyship, x, y);
  }
  void move() {
    y+=speed;
    //x+=speed;
    //if(x > width){
    //  speed*=-1;
    //} else if(x<0){
    //  speed*=-1;
    //}
  }
  boolean reachedBottom() {
    if (y>height+50) {
      return true;
    } else {
      return false;
    }
  }
}
