/*
    Purpose: Display statistics about some set of nodes
*/
class CodeCity extends Renderable{
  
  public CodeCity(){
  }
  
  // Render loop
  public void render(){
      float XStart = offsetX;
      float YStart = offsetY+h;
      float ZStart = 0;

      float xPosition = XStart;
      float yPosition = 0;
      
      float xSize = 5;
      float ySize = 10;
      float zSize = 10;
      
      // Render a grid
      for(int i =0; i < cells.size(); i++){
          pushMatrix();
              translate(xPosition,YStart+yPosition,ZStart);
              xPosition += xSize;
              if(xPosition > w+XStart)
              {
                xPosition = XStart;
                yPosition -= ySize;
              }
              box(xSize,ySize,zSize);
          popMatrix();
      }
  }
  
}