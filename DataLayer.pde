/*
  
    Purpose: Single place to inherit data from

*/
import java.util.*;
import java.util.concurrent.*;


class DataLayer{
 
   // This needs to be thread-safe, because we clear the cells and also render them at the same time.
   CopyOnWriteArrayList<Cell> cells;  
     
   public DataLayer(){
      cells = new CopyOnWriteArrayList<Cell>();
      
      for(int i=0; i < 100; i++){
        cells.add(new Cell("test"));
      }
   }
  
   void addcell(Cell c){
     cells.add(c);
   }
   
   // Get the list of cells and transform them
   CopyOnWriteArrayList<Cell> getCells(){
     return cells;
   }
  
   // Get all of the cells, and set them to a new set
   // This is one way to copy all the cells from one visualization to another
   void setCells(ArrayList<Cell> newCells){
     // Remove our old list of cells
     cells.clear();
     
     // Set our new list
     for(int i=0; i < newCells.size();++i){
         cells.add(newCells.get(i));
     }
   }
   
   // Traverses all of the cells and their children
   // Performs a breadth-first search
   void traverseCells(){
       Queue<Cell> bfs = new LinkedList<Cell>();
       
       // Populate our Queue with the roots
       for(int i =0; i < cells.size();++i){
         bfs.add(cells.get(i));
       }
       
       while(!bfs.isEmpty()){
          Cell current = bfs.remove();
          for(int i =0; i < current.metaData.children.size(); ++i){
             bfs.add(current.metaData.children.get(i));
          }
          println(current.metaData.name);
       }
       
   }
   
}