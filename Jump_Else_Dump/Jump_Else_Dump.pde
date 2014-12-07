import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

//object of the Box2D helper class
Box2DProcessing box2d;
//object of the helper class for creating the slabss

Boxy box;
Boundary leftWall;
Boundary rightWall;
Slab slab;

void setup() {
  size(600, 600);
  //  frameRate(2);
  println("The height is"+height);
  box2d= new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -150);
  box = new Boxy(width/2, height/2-100);
  //  leftWall = new Boundary(50, height/2, 10, height);
  slab = new Slab();
  leftWall = new Boundary(width-width-1, height/2, 0, height);
  rightWall = new Boundary(width, height/2, 0, height);
}



void draw() {
  box2d.step();
  slab.display();
  box.display();  
  fill(0);
  line(50, height/2, width-50, height/2);
}

void mousePressed() {
  box.jump();
  println("mousePressed called");
}

