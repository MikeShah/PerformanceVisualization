/*
    Purpose: Display statistics about some set of nodes
*/
class Histogram extends Renderable{
  
  public Histogram(){
  }
  
  // Render loop
  public void render(){
      float numberOfBars = 10;
      float widthOfBars = w / numberOfBars; // width of the canvas area, divided by how many bars we have

      // Render a grid
      for(int i =0; i < numberOfBars; i++){
          float barHeight = 10;
          fill(0,64,192);
          rect(offsetX+(i*widthOfBars),offsetY+h-barHeight,widthOfBars,barHeight);
      }
  }
  
}