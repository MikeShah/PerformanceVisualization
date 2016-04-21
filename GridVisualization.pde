class GridVisualization extends Renderable{
  
  public GridVisualization(){
  }
  
  // Render loop
  public void render(){
      
      float cellWidth = 5;
      float cellHeight = 5;
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
  
}