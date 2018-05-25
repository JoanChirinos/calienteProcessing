// Caliente: Aaron Li, Joan Chirinos, George Liang
// APCS2 pd8
// HW53 -- All That Bouncin'
// 2018-05-23

class Ball {

  //states
  final static int MOVING = 0;
  final static int GROWING = 1;
  final static int SHRINKING = 2;
  final static int DEAD = 3;
  final float CHANGE_FACTOR = 0.5;
  final float MAX_RADIUS = 65;


  // instance vars
  float x, y, size, rad, dx, dy;
  int state;
  color c;

  Ball(int newState, float newX, float newY) {
    state = newState;
    x = newX;
    y = newY;
    c = color(random(255), random(255), random(255));
    size = 40;
    rad = size / 2.0;
    dx = random(1, 4);
    dy = random(1, 4);
  }

  void action() {
    fill(c);
    if (state == MOVING) move();
    else if (state == GROWING) grow();
    else if (state == SHRINKING) shrink();
  }

  void move() {
    if (x <= rad || x >= 600 - rad) dx *= -1;
    else if (y <= rad || y >= 600 - rad) dy *= -1;
    x += dx;
    y += dy;
    ellipse(x, y, size, size);
  }

  void grow() {
    if (rad < MAX_RADIUS) {
      size += CHANGE_FACTOR;
      rad = size / 2.0;
      ellipse(x, y, size, size);
    } else state = SHRINKING;
  }

  void shrink() {
    if (rad > 0) {
      size -= CHANGE_FACTOR;
      rad = size / 2.0;
      ellipse(x, y, size, size);
    } else state = DEAD;
  }
}
