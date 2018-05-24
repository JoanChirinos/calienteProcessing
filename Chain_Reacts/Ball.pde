// Caliente: Aaron Li, Joan Chirinos, George Liang
// APCS2 pd8
// HW53 -- All That Bouncin'
// 2018-05-23

class Ball {

  // instance vars
  float heading, x, y, speed;
  int dW, dH;
  int size;
  color circles; 

  // constructor
  Ball(int dWidth, int dHeight) {
    //storing display width and height
    dW = dWidth;
    dH = dHeight;

    //random, but not totally tiny, size
    size = (int)(random(min(dW, dH) / 40, min(dW, dH) / 20));

    //x and y set so that ball is within bounds;
    x = random(size, dWidth - size);
    y = random(size, dHeight - size);

    // sets color
    float r = random(255);
    float g = random(255);
    float b = random(255);
    circles = color(r, g, b);
    
    //set speed to a random, but reasonable, speed (in pixels/frame)
    speed = random(2, 4);

    //set random heading from 0 to 360
    heading = random(0, 360);
  }

  void move() {
    if ((heading > 90 && heading < 270 && x <= size) || ((heading < 90 || heading > 270) && x + size >= dW)) {
      heading = (180 - heading + 360) % 360;
      speed = random(2, 4);
    } else if ((heading < 180 && heading > 0 && y <= size) || (heading > 180 && heading < 360 && y + size >= dH)) {
      heading = (heading * -1 + 360) % 360;
      speed = random(2, 4);
    }
    fill(circles);
    ellipse(x, y, size * 2 + 1, size * 2 + 1);

    fill(circles);
    //move ball in direction heading (0 is right) a distance of speed
    x += cos(radians(heading)) * speed;
    y -= sin(radians(heading)) * speed;
    ellipse(x, y, size * 2, size * 2);
  }
}
