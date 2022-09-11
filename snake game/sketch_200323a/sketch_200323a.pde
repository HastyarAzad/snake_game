snake s;
int scale = 20;
PVector food;
int lastPosition = 0;

void setup() {
  size(2000, 1000);
  fill(0);
  s = new snake();
  frameRate(20);
  pickFoodLocation();
}


void draw() {

  background(0);
  s.death();
  s.update();
  s.show();  
  rect(food.x, food.y, scale, scale);

  if (s.eat(food)) {
    pickFoodLocation();
  }
}

void pickFoodLocation() {
  int cols = width/scale;
  int rows = height/scale;
  food = new PVector(floor(random(cols)), floor(random(rows)));
  food.mult(scale);
}


void mousePressed() {
  s.size+=10;
}


void keyPressed() {
  float x = 1;
  
  if (key == CODED) {
    if (keyCode == UP && lastPosition != 2) {
      s.dir(0, -x);
      lastPosition = 1;
    } else if (keyCode == DOWN && lastPosition != 1) {
      s.dir(0, x);
      lastPosition = 2;
    } else if (keyCode == LEFT && lastPosition != 4) {
      s.dir(-x, 0);
      lastPosition = 3;
    } else if (keyCode == RIGHT && lastPosition != 3) {
      s.dir(x, 0);
      lastPosition = 4;
    }
  }
}
