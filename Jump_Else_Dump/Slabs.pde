public class Slab {
  Boundary leftSlab;
  Boundary rightSlab;
  Vec2 velocity = new Vec2(0, 0);

  float gap, h=0.05*height; //h is the height of the slab
  float firstX, firstY, firstWidth; 
  float secondStart, secondX, secondY, secondWidth;

  public Slab(float yPos) {


    firstWidth=int(random(0.15*width, 0.70*width));
    firstX=firstWidth/2;
    firstY=yPos;
    //The y position of the slab

    leftSlab= new Boundary(firstX, firstY, firstWidth, h);
    //The gap between the both slabs
    gap=int(0.15*width);

    secondStart=firstWidth+gap;
    secondWidth= width-secondStart;
    secondX= secondStart+(secondWidth/2);
    secondY=yPos;

    rightSlab = new Boundary(secondX, secondY, secondWidth, h);
  }
  public Slab() {
    //The gap between the both slabs
    gap=int(0.20*width);


    firstWidth=(width/2)-(gap/2);
    firstX=firstWidth/2;
    firstY=height/2;
    //The y position of the slab

    leftSlab= new Boundary(firstX, firstY, firstWidth, h);

    secondStart=firstWidth+gap;
    secondWidth= width-secondStart;
    secondX= secondStart+(secondWidth/2);
    secondY=height/2;
    rightSlab = new Boundary(secondX, secondY, secondWidth, h);
  }

  void display() {

    leftSlab.display();
    rightSlab.display();
  }
  void pullDown(float yVel) {
    velocity.y= -yVel;
    leftSlab.setVelocity(velocity);
    rightSlab.setVelocity(velocity);
  }
  float getYPosition() {
    Vec2 leftPos;    
    leftPos=leftSlab.getBodyPosition();  
    return leftPos.y;
  }

  void killSlabs() {
    leftSlab.killBoundary();
    rightSlab.killBoundary();
  }

  void checkAndkill() {
    if (getYPosition() > height+h)
      this.killSlabs();
  }
}

