

class Drop {
  
  float x = random(width); 
  float y = random(-1500,-50);
  float len = random(5, 20);
  float speed = random(4,10);
  
  
  //Drop(float _x, float _y, float l, float s) {
  //  x = _x; y = _y;
  //  len = l;
  //  speed = s;
  //}
  
  void fall() {
    y = y + speed;
    speed += 0.1;
    
    if(y > height) {
      y = random(-200,-100);
      speed = random(4,10);
    }
    
  }
  
  void display() {
    stroke(3,74,236);
    line(x,y,x,y+len);
  }
  
}