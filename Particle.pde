

class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  
  float lifespan;
  
  Particle(PVector p) {
    pos = p.copy(); //copy because if set equal to, they would all reference the same thing
    vel = new PVector(random(-2,2), random(-2,2));
    acc = new PVector(0,0);
    lifespan = 90.0;
  }
  
  void applyForce(PVector force) {
    acc.add(force);
  }
  
  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    lifespan -= 3.0;
  }
  
  boolean isDead() {
    if(lifespan < 0) {
      return true;
    } else {
      return false;
    }
  }
  
  void display() {
    noStroke();
    fill(3, 74, 236,lifespan);
    ellipse(pos.x, pos.y, 12,12);
  }
  
}