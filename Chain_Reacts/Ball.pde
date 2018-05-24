class Ball {

  float heading, x, y, speed;
  int dW, dH;
  int size;
  
  Ball(int dWidth, int dHeight) {
    //storing display width and height
    dW = dWidth;
    dH = dHeight;
    
    //random, but not totally tiny, size
    size = (int)(random(min(dW, dH) / 40, min(dW, dH) / 20));
  
    //x and y set so that ball is within bounds;
    x = random(size, dWidth - size);
    y = random(size, dHeight - size);
  
  
    //set speed to a random, but reasonable, speed (in pixels/frame)
    speed = random(2, 4);
  
    //set random heading from 0 to 360
    heading = random(0, 360);
  }
  
  void move() {
    if ((heading > 90 && heading < 270 && x <= size) || ((heading < 90 || heading > 270) && x + size >= dW)) {
      heading = (180 - heading + 360) % 360;
      speed = random(2, 4);
    }
    else if ((heading < 180 && heading > 0 && y <= size) || (heading > 180 && heading < 360 && y + size >= dH)) {
      heading = (heading * -1 + 360) % 360;
      speed = random(2, 4);
    }
    fill(0, 0, 0);
    ellipse(x, y, size * 2 + 1, size * 2 + 1);
    fill(255, 255, 255);
    //move ball in direction heading (0 is right) a distance of speed
    x += cos(radians(heading)) * speed;
    y -= sin(radians(heading)) * speed;
    ellipse(x, y, size * 2, size * 2);
  }
  
}
