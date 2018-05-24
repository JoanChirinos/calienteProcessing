// Caliente: Aaron Li, Joan Chirinos, George Liang
// APCS2 pd8
// HW53 -- All That Bouncin'
// 2018-05-23

// instance vars
Ball[] balls; // stores balls
boolean moveToggle; // toggles ball movement

// setup sets window and creates balls
void setup() {
  moveToggle = true;
  size(600, 600);
  background(0, 0, 0);
  int numBalls = (int)(random(25, 36));
  balls = new Ball[numBalls];
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(600, 600);
  }
}

// if toggled, move
void draw() {
  if (moveToggle) {
    for (Ball b : balls) {
      b.move();
    }
  }
}

// checks if mouse is clicked, changes toggle
void mouseClicked() {
  moveToggle = !moveToggle;
}
