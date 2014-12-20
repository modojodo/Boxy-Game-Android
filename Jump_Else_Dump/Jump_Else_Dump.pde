import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;


Box2DProcessing  box2d;              //object of the Box2D helper class

Boxy box;
Boundary leftWall;
Boundary rightWall;
float distance;                   //the distance among the stack of slabs
ArrayList<Slab> slabs;
float pullMargin;
int noOfSlabs;
float SLAB_GAP;

void setup() {

  size(600, 600);

  distance = height/2;
  SLAB_GAP= 0.40*height;
  //  frameRate(2);
  slabs= new ArrayList<Slab>();
  box2d=new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -100);
  box = new Boxy(width/2, height/2); 
  Slab s = new Slab();
  slabs.add(s);
  leftWall = new Boundary(width-width-1, height/2, 0, height);
  rightWall = new Boundary(width, height/2, 0, height);
}



void draw() {
  background(255);
  box2d.step();
  if (slabs.get(slabs.size()-1).getYPosition()+50>SLAB_GAP) {
    Slab newSlab= new Slab(slabs.get(slabs.size()-1).getYPosition()-SLAB_GAP);
    slabs.add(newSlab);
  }

  for (Slab slab : slabs) {
    slab.display();
  }

  box.display();
  //
  //  fill(0);
  //  line(50, height/2, width-50, height/2);
}

void mousePressed() {
  pullMargin = box.jump();
  for (Slab slab : slabs) {
    slab.pullDown(pullMargin);
  }

  // kill the salb if it is out of the port view
  if (slabs.size()==0) {
  } else  if ( slabs.get(0).getYPosition()>height + 0.05*height) {
    slabs.get(0).killSlabs();
    slabs.remove(0);
  }
}

