public class Slab {
  Boundary leftSlab;
  Boundary rightSlab;

  int gap;
  int firstX, firstY, firstWidth, firstHeight; 
  int secondStart, secondX, secondY, secondWidth, secondHeight;
  static float distance=0; 

  public Slab() {
    firstWidth=int(random(0.15*width, 0.70*width));
    firstX=firstWidth/2;
    firstY=60;
    //The y position of the slab
    firstHeight=20;
    leftSlab= new Boundary(firstX, firstY, firstWidth, firstHeight);
    //The gap between the both slabs
    gap=int(0.15*width);

    secondStart=firstWidth+gap;
    secondWidth= width-secondStart;
    secondHeight=20;
    secondX= secondStart+(secondWidth/2);
    secondY=60;
   
  rightSlab = new Boundary(secondX, secondY, secondWidth, secondHeight);
}

void display() {
  background(255);
  leftSlab.display();
  rightSlab.display();
}
}
