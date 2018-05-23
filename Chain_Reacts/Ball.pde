color c;
int x;
int y;
int r;
int g;
int b;
int radius;
int xMovement;
int yMovement;
//Circle will be of constant radius 10
void setup() {
  r = (int) random(256);
  g = (int) random(256);
  b = (int) random(256);
  c = color(r, g, b);
  //By default I want a circle in the top left corner
  radius = 10;
  x = radius;
  y = radius;
  xMovement = 1;
  yMovement = 1;
}
//I do not want to hit a wall so i must account for center vs wall
void draw(){
 background(0,0,0);
 
}
color getColor(){
  return c;
}