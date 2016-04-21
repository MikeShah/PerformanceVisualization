/*
    Purpose: Display statistics about some set of nodes
*/

class ParticleSystem extends Renderable{

  ArrayList<Particle> particles;
  
// A simple Particle class
  public ParticleSystem(){
    particles = new ArrayList<Particle>();
    
    float emissionXStart = (offsetX+w/2);
    float emissionYStart = (offsetY+h/2);
      
    // For each cell, create a particle
    for(int i =0; i < cells.size(); ++i){
      particles.add(new Particle(emissionXStart,emissionYStart,0));
    }
    updateOffsets();
  }
  
  // For the particle system, we have to override this method
  // and constantly set the offsets for each particle
  void updateOffsets(){
    float emissionXStart = (offsetX+w/2);
    float emissionYStart = (offsetY+h/2);
      
    // For each cell, create a particle
      for(int i =0; i < particles.size(); i++){
        particles.get(i).initialPosition.x = emissionXStart;
        particles.get(i).initialPosition.y = emissionYStart;
    }
  }

  // Render loop
  public void render(){
    updateOffsets();
      // Render a particle system
      float particleSize = 5;
      
      for(int i =0; i < particles.size(); i++){
          fill(particles.get(i).rgb.x,particles.get(i).rgb.y,particles.get(i).rgb.z);
          particles.get(i).run();
          // If the rectangle is out of bounds, then do not render it
          if(particles.get(i).position.x+particleSize > offsetX+w || particles.get(i).position.x < offsetX+particleSize || particles.get(i).position.y < offsetY+particleSize || particles.get(i).position.y+particleSize > offsetY+h){
            
          }else{
            // Otherwise, render the particle
            rect(particles.get(i).position.x,particles.get(i).position.y,particleSize,particleSize);
          }
      }
  }
  
} // class ParticleSystem
  