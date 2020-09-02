class Star {
  int x,y,r,speed;
  
  //constructor method
  Star(int x, int y) {
    this.x = x;
    this.y = y;
    r = int(random(1,5));
    speed = int(random(1,6));
  }
  
  //display method
  void display(){
    noStroke();
    fill(random(255),random(255),random(255));
    ellipse(x,y,r,r);
  }
  
  //move method
  void move() {
    y+=speed;
  }
  
  //reached bottom
  boolean reachedBottom() {
    if(y>height+50){
      return true;
    } else {
      return false;
    }
  }
}
