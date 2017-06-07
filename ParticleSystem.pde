
class ParticleSystem {
  
  ArrayList<Particle> parts;
  PVector origin;
  int locked = 0;
  
  ParticleSystem(PVector o) {
    origin = o.copy();
    parts = new ArrayList<Particle>();
  }
  
  void applyForce(PVector force) {
    for(int i = 0; i < parts.size(); i++) {
      parts.get(i).applyForce(force);
    }
  }
  
  void addParticle() {
    if(locked >= 200) {
      locked = 0;
      println("add available");
    }
    println(locked);
    parts.add(new Particle(origin));
  }
  
  void addParticle(Particle p) {
    p.pos = origin.copy();
    parts.add(p);
  }
  
  void run() {
    for(int i = parts.size()-1; i >= 0; i--) {
      Particle p = parts.get(i);
      if(p.isDead()) {
        parts.remove(i);
      } else {
        p.update();
        p.display();
      }
    }
  }
  
}