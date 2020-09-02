Spaceship s1;
//Enemyship s2;
ArrayList<Rock> rocks;
ArrayList<Laser> lasers;
ArrayList<Star> stars;
ArrayList<Enemyship> enemyships;

Timer rockTimer;
int rockRate;
PImage bg;
PImage bgg;
int score = 0;
boolean play = false;
Timer enemyTimer;
int enemyshipRate = 5000;


void setup() {
  size(500, 800);
  bg = loadImage("StartGame.jpg");
  bgg = loadImage("GameOver.jpg");
  s1 = new Spaceship(0, 0);
  rocks = new ArrayList<Rock>();
  lasers = new ArrayList<Laser>();
  stars = new ArrayList<Star>();
  enemyships = new ArrayList<Enemyship>();
  enemyTimer = new Timer(enemyshipRate);
  enemyTimer.start();
  rockRate = 1000;
  rockTimer = new Timer(rockRate);
  rockTimer.start();
  //for (int i = 0; i<rocks.length; i++) {
  //  rocks[i] = new Rock(int(random(width)), int(random(-10000, 20)));
  //}
}

void draw() {
  background(0);
  noCursor();

  // check for play
  if (!play) {
    startScreen();
  } else if (play) {

    if (rockTimer.isFinished()) {
      rocks.add(new Rock(int(random(width)), -50));
      rockTimer.start();
    }
    if (enemyTimer.isFinished()) {
      enemyships.add(new Enemyship(int(random(width)), 50));
      enemyTimer.start();
    }

    //Rendering Star Field
    stars.add(new Star(int(random(width)), -50));
    for (int i = stars.size()-1; i>=0; i--) {
      Star star = (Star) stars.get(i);
      star.display();
      star.move();
      if (star.reachedBottom()) {
        stars.remove(star);
      }
    }

    //Rendering Rocks
    for (int i = rocks.size()-1; i>=0; i--) {
      Rock rock = (Rock) rocks.get(i);
      rock.display();
      rock.move();
      if (rock.reachedBottom()) {
        rocks.remove(rock);
      }
      // Rock vs Laser Collision Detection
      for (int j = lasers.size()-1; j>=0; j--) {
        Laser laser = (Laser) lasers.get(j);
        if (dist(laser.x, laser.y, rock.x, rock.y)<rock.w/5) {
          score+=100;
          lasers.remove(laser);
          rock.health-=laser.damage;
          if (rock.health<5) {
            rocks.remove(rock);
          }
        }
      }

      // Ship vs Rock Collision Detection
      if (dist(s1.x, s1.y, rock.x, rock.y)<rock.w/3) {
        if (rock.isPU) {
          rocks.remove(rock);
          //Health increase
          s1.health+=20;
          score+=rock.health;
        } else {
          rocks.remove(rock);
          s1.health-=10;
          score+=rock.health;
        }
      }
    }
    // Enemyship display
    for (int i = enemyships.size()-1; i>=0; i--) {
      Enemyship enemyship = (Enemyship) enemyships.get(i);
      enemyship.display();
      enemyship.move();
      if (enemyship.reachedBottom()) {
        enemyships.remove(enemyship);
      }
    }
  }
  //Enemyship lasers detection

  //Rendering Lasers
  for (int i = lasers.size()-1; i>=0; i--) {
    Laser laser = (Laser) lasers.get(i);
    laser.display();
    laser.fire();
    if (laser.reachedTop()) {
      lasers.remove(laser);
    }
  }
  //Display Ship
  infoPanel();
  s1.display(mouseX, mouseY);

  // game over logic
  if (s1.health < 1) {
    play = false;
    gameOver();
  } else {
    play = true;
  }
}


void infoPanel() {
  fill(127, 127);
  rect(0, 760, width, 40);
  fill(255);
  text("Score:" + score, 20, 780);
  text("Health:" + s1.health, 160, 780);
  text("Press A, S, or D to shoot", 300, 780);
}

void mousePressed() {
  lasers.add(new Laser(s1.x-30, s1.y));
  lasers.add(new Laser(s1.x+30, s1.y));
}

void keyPressed() {
  println(key);
  println(keyCode);
  if (key == 's') {
    lasers.add(new Laser(s1.x-30, s1.y));
    lasers.add(new Laser(s1.x+30, s1.y));
  } else if (key == 'a') {
    lasers.add(new Laser(s1.x-30, s1.y));
  } else if (key == 'd') {
    lasers.add(new Laser(s1.x+30, s1.y));
  }
}

void startScreen() {
  background(0);
  imageMode(CORNER);
  image(bg, 0, 0);
  text("Made by : Constantine Linardakis", 170, 780);
  if (mousePressed) {
    play = true;
  }
}

void gameOver() {
  background(0);
  imageMode(CORNER);
  image(bgg, 0, 0);
  noLoop();
  text("Score:" + score, 230, 450);
}
