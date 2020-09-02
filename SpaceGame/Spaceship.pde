
class Spaceship {
  //Member Variables
  int x, y, w, h;
  float health;
  //color c;
  PImage ship;
  PImage s2;
  boolean isPU;

  //Constructor
  Spaceship(int x, int y) {
    this.x = x;
    this.y = y;
    w = 20;
    h = 20;
    health = 100;
    //c = color(#49FF03);
    ship = loadImage("SpaceShip1.png");
    s2 = loadImage("SpaceShip2(Upgraded).png");
    isPU = false;
  }

  //Display Method
  void display(int tempX, int tempY) {
    if (isPU) {
      imageMode(CENTER);
      x = tempX;
      y = tempY;
      image(ship, x, y);
    } else {
      imageMode(CENTER);
      x = tempX;
      y = tempY;
      image(ship, x, y);
    }
  }
  //Fire method
}
