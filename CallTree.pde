class CallTree{
   
   CallTreeNode root;
   int totalNodes;
   
   public CallTree(){
     root = new CallTreeNode("root");
   }
   
   /*
        "Call Tree - Method","Total Time [%]","Total Time","Invocations",
        " All threads","0.0","0","0"
        "  AWT-EventQueue-0","100.0","1344","1"
        "   javax.swing.Timer$DoPostEvent.run()","98.065475","1318","31"
        "    Self time","76.41369","1027","31"
        "    processing.app.ui.EditorConsole$1.actionPerformed(java.awt.event.ActionEvent)","21.577381","290","31"
        "     Self time","15.401786","207","31"
        "     processing.app.ui.EditorConsole.flush()","6.1755953","83","31"
        "   processing.app.ui.EditorConsole.flush()","2.0089285","27","1"
   */
   
   // Returns the number of leading spaces in a string
   // Paramter: Start, tells where to start looking in the substring
   public int indendation(String s){
     int spaces = 0;
     for(spaces = 0; spaces < s.length(); ++spaces){
        if(s.charAt(spaces) != ' '){
          break;
        }
     }
     return spaces;
   }
   
   // Loads a call tree file
   // Parses a Call tree, that stores nodes based on indentation
   //
   // Algorithm:
   // (1) Read in each line 
   // (2) For each node, see how many times it's indented
   //     (a) If the number is greater than the last one, then add it as a child.
   //     (b) If it is equal, then push it onto the stack
   //     (c) If it is less, then push everything as a child until the indentation is equal or stack is empty
   public void load(String fileName){
     String lines[] = loadStrings(fileName);
     // Reset total nodes that exist in the Call Tree
     totalNodes = 0;
     
     // Walks a call tree file and then 
     Stack<CallTreeNode> walker = new Stack<CallTreeNode>();
     // By default, put our root node on top
     walker.push(root);
     
     // Read all of the nodes
     for (int i = 0 ; i < lines.length; i++) {
        // (1) Print out the line that we read in from the file 
        //     We also create a node for it.
        String  line = lines[i].substring(1);
        println(line);
        totalNodes++;
        
        CallTreeNode c = new CallTreeNode(lines[i].substring(1));
        // set the level of the node
        c.level = indendation(line);

        // (2) If walker is empty, then simply add in the first node read.
        //     If the stack is not empty, then:
        //         (a) If indentation is greater, than it is a child of the top of the stack
        //         (b) If indentation is equal, then point child to last nodes parent and go ahead and push on stack
        //         (c) If indentation is less, then pop stack until indentation is equal to top of stacks node, and then point to that nodes parent (because they share the same parent)
        if(walker.isEmpty()){
                walker.push(c);
        }else{
                // Temp add everything as a child
                if(c.level > walker.peek().level){
                  c.parent = walker.peek();
                  walker.peek().addChild(c);
                  walker.push(c);
                }
                else if(c.level == walker.peek().level){
                  c.parent = walker.peek().parent;
                  walker.push(c);
                }
                else{
                  while(c.level < walker.peek().level && !walker.isEmpty()){
                    walker.pop();
                  }
                  if(c.level == walker.peek().level){
                    c.parent = walker.peek().parent;
                    walker.push(c);
                  }
                  else{
                    c.parent = walker.peek().parent;
                    walker.peek().addChild(c);
                    walker.push(c);
                  }
                }
        }
        println(walker.size());
      } // for (int i = 0 ; i < lines.length; i++) {
        
      // Whatever is left on the stack, belongs to the root, so add it as a child
      
      while(!walker.isEmpty()){
        CallTreeNode c = walker.pop();
        if (c != root && c!=null){
          root.addChild(c);
        }
        println(walker.size());
      }
      
     printTree();
     
   }
   
   // Print call Tree
   // Bread-first traversal to recreate the call tree
   public void printTree(){     
       int counter = 0;  // Counts how many items are in the tree.
       Queue<CallTreeNode> bfs = new LinkedList<CallTreeNode>();
       bfs.add(root);
       while(!bfs.isEmpty()){
         // Remove the first node of our queue
         CallTreeNode top = bfs.remove();
         counter++;
         // Print out the node we removed
         println(top.level+":"+top.m_methodName+" children="+top.children.size());         
         // Add all of the children
         for(int i=0; i < top.children.size();++i){
           top.children.get(i).level = top.level+1;  // All child nodes are located one below from their parent
           bfs.add(top.children.get(i));
         }
       }
       println(counter+" items in tree.");
   }
   
   // Bread-first traversal to recreate the call tree
   // Returns the tree in a linear list.
   // TODO: This should be sorted by time after we get all of the nodes.
   public ArrayList<CallTreeNode> getLinearTree(){
       ArrayList<CallTreeNode> nodeNames = new ArrayList<CallTreeNode>();
     
       Queue<CallTreeNode> bfs = new LinkedList<CallTreeNode>();
       bfs.add(root);
       while(!bfs.isEmpty()){
         // Remove the first node of our queue
         CallTreeNode top = bfs.remove();
         // Print out the node we removed
         println(top.level+":"+top.m_methodName);
         nodeNames.add(top);
         
         // Add all of the children
         for(int i=0; i < top.children.size();++i){
           top.children.get(i).level = top.level+1;  // All child nodes are located one below from their parent
           bfs.add(top.children.get(i));
         }
       }
       
       return nodeNames;
   }
   
}