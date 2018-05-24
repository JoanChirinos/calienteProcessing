Ball[] balls;
boolean moveToggle;

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

void draw() {
  if (moveToggle) {
    for (Ball b : balls) {
      b.move();
    }
  }
}

void mouseClicked() {
  moveToggle = !moveToggle;
}
