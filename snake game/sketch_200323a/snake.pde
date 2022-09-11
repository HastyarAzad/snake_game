class snake {

  float x, y, xSpeed, ySpeed;
  ArrayList<PVector> tail = new ArrayList<PVector>();
  int size;


  void update() {
    if (size > 0) {
      if (size == tail.size() && !tail.isEmpty()) {
        tail.remove(0);
      }
      tail.add(new PVector(this.x, this.y));
    }

    this.x = this.x + this.xSpeed*scale;
    this.y = this.y + this.ySpeed*scale;

    this.x = constrain(this.x, 0, width-scale);
    this.y = constrain(this.y, 0, height-scale);
  }
  
  void death() {
    for (int i = 0,j=tail.size(); i < tail.size(); i++,j--) {
      PVector pos = tail.get(j-1);
      float d = dist(x, y, pos.x, pos.y);
      if (d < 1) {
        println("starting over");
        size -= j;
        for (int x = 0; x<j; x++){
          tail.remove(0);
        }
      }
    }
  }

  void show() {
    fill(100,255,100);   
    for (PVector v : tail) {
      rect(v.x, v.y, scale, scale);
    }
    rect(this.x, this.y, scale, scale);
  }


  void eaten() {
  }  
  boolean eat(PVector pos) {
    float distance = dist(this.x, this.y, pos.x, pos.y);
    if (distance < 2) {
      size++;
      return true;
    } else {
      return false;
    }
  }

  void dir(float x, float y) {
    this.xSpeed = x;
    this.ySpeed = y;
  }
}
