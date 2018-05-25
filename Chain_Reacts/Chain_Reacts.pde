// Caliente: Aaron Li, Joan Chirinos, George Liang
// APCS2 pd8
// HW53 -- All That Bouncin'
// 2018-05-23

// instance vars
ArrayList<Ball> balls; // stores balls

// setup sets window and creates balls
void setup() {
  size(600, 600);
  background(0, 0, 0);
  int numBalls = (int)(random(25, 36));
  balls = new ArrayList<Ball>();
  for (int i = 0; i < numBalls; i++) {
    float x = random(16, 584);
    float y = random(16, 584);
    balls.add(new Ball(0, x, y));
  }
}

// if toggled, move
void draw() {
  background(0, 0, 0);
  for (int i = 0; i < balls.size(); i++) {
    Ball test1 = balls.get(i);
    
    //this just tests if any growing and moving balls are touching
    for (int otherBall = i + 1; otherBall < balls.size(); otherBall++) {
      Ball test2 = balls.get(otherBall);
      if (touching(test1, test2)) {
        if ((test1.state == 1 || test1.state == 2) && test2.state == 0) {
          test2.state = 1;
        }
        else if ((test2.state == 1 || test2.state == 2) && test1.state == 0) {
          test1.state = 1;
        }
      }
    }
    
    //does the respective action on each ball
    test1.action();
  }
}

void mouseClicked() {
  //adds a new growing ball to the AL that stores balls
  balls.add(new Ball(1, mouseX, mouseY));
}

boolean touching(Ball b1, Ball b2) {
  //returns true if balls are touching using Pythagoream Formula
  return pow(b1.x - b2.x, 2) + pow(b1.y - b2.y, 2) < pow(b1.rad + b2.rad, 2);
}
