/*
  Purpose: Class to be used with the Particle System
*/

class Particle{
  
  PVector initialPosition; // initial spawn position
  PVector position;
  PVector velocity;
  float lifeSpan;
  float initialLifeSpan;
  PVector rgb;
  float alpha;
  
  boolean particleIsAlive = true;
  
  public Particle(float x, float y, float z){
    rgb = new PVector(255,255,255);
    alpha = 128;
    
    velocity = PVector.random3D();
    
    position = new PVector(x,y,z);
    initialPosition = new PVector(x,y,z);
    
    lifeSpan = 2.0;
    initialLifeSpan = lifeSpan;
  }
  
  void run(){
    if(lifeSpan >= 0.0){
      lifeSpan -= 0.01;
      particleIsAlive = true;
      position.add(velocity);
      //text(lifeSpan,position.x,position.y);
    }
    else{
      // Reset the particle
      deadParticle();
    }
  }
  
  // Reset a particle if it dies
  void deadParticle(){
      particleIsAlive = false;
      position.x = initialPosition.x;   position.y = initialPosition.y;   position.z = initialPosition.z;
      lifeSpan = initialLifeSpan;
  }
  
}