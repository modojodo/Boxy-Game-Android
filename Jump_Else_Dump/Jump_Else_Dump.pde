import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;


Box2DProcessing  box2d;              //object of the Box2D helper class

Boxy box;
Boundary leftWall;
Boundary rightWall;
float distance;                   //the distance among the stack of slabs
boolean didRun=false;               //a boolean variable to check if the game has started  
ArrayList<Slab> slabs;
float pullMargin;

int noOfSlabs;
float SLAB_GAP;
void setup() {

  size(600, 600);

  distance = height/2;
  SLAB_GAP= 0.10*width;
  //  frameRate(2);
  slabs= new ArrayList<Slab>();
  box2d=new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -100);
  box = new Boxy(width/2, height/2); 
  Slab s = new Slab();
  slabs.add(s);
  didRun=true; 
  leftWall = new Boundary(width-width-1, height/2, 0, height);
  rightWall = new Boundary(width, height/2, 0, height);
}



void draw() {
  box2d.step();
  //
  //  if (slabs.get(slabs.size()-1).getYPosition()>SLAB_GAP) {
  //    println("Slab Gap: "+SLAB_GAP);
  //    println("got called!!!");
  //    Slab newSlab= new Slab(slabs.get(slabs.size()-1).getYPosition()-SLAB_GAP);
  //    slabs.add(newSlab);
  //  }
  //
  //  // kill the group of slabs is it is out od the portview
  //  if (slabs.get(slabs.size()-1).getYPosition()>height) {
  //    slabs.get(slabs.size()-1).killSlabs();
  //  }


  for (Slab slab : slabs) {
    slab.display();
  }

  box.display();

  fill(0);
  line(50, height/2, width-50, height/2);
}

void mousePressed() {
  pullMargin = box.jump();
  for (Slab slab : slabs) {
    slab.pullDown(pullMargin);
  }
  println("mousePressed called");
}

