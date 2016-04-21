/*
    Purpose: Display statistics about some set of nodes
*/
class TreeMap extends Renderable{
  
  public TreeMap(){
  }
  
  // Render loop
  public void render(){
      float cellWidth = 15;
      float cellHeight = 15;
      float yOffset = offsetY;
      float xOffset = offsetX;
      // Render a grid
      for(int i =0; i < cells.size(); i++){
        cells.get(i).setRGB(255,0,0);
        cells.get(i).setXYZ(xOffset,yOffset,0);
        cells.get(i).setWHD(cellWidth,cellHeight,0);
        cells.get(i).render();
                 
        xOffset += cellWidth;

        if(xOffset > w+offsetX-cellWidth){
          xOffset = offsetX;
          yOffset += cellHeight;
        }
      }
  }
  
  public void drawTreeMap(){
  }
  
}