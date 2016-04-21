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
      float ZStart = 5;

      float xPosition = XStart;
      float yPosition = 0;
      
      float xSize = 5;
      float ySize = 10;
      float zSize = 10;
      
      // Render a grid
      for(int i =0; i < cells.size(); i++){
            cells.get(i).setRGB(255,0,0);
            cells.get(i).setXYZ(xPosition,YStart+yPosition,ZStart);
            cells.get(i).setWHD(xSize,ySize,zSize);              
            xPosition += xSize;
            if(xPosition > w+XStart)
            {
              xPosition = XStart;
              yPosition -= ySize;
            }

             cells.get(i).render3D();
      }
  }
  
}