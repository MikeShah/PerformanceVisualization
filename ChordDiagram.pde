/*
    Purpose: Display statistics about some set of nodes
*/
class ChordDiagram extends Renderable{
  
  public ChordDiagram(){
  }
  
  // Render loop
  public void render(){      
      float centerX = (offsetX+w/2);
      float centerY = offsetY+h/2;
      
      float angle = 360;
      if(cells.size() > 0){
       angle = 360 / cells.size();
      }
      ellipse(centerX,centerY,w,h);
      // Render a grid
      for(int i =0; i < cells.size(); i++){
         float t = i*angle;
         float xPos = centerX+(w/2)*cos((t));
         float yPos = centerY+(h/2)*sin((t));
         cells.get(i).setRGB(255,0,0);
         cells.get(i).setXYZ(xPos,yPos,0);
         cells.get(i).setWHD(5,5,0);
         cells.get(i).render();
         //ellipse(xPos,yPos,5,5);
      }
  }
  
}