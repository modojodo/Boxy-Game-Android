import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;
Boxy box;
Boundary leftWall;
//Boundary rightWall;

void setup() {
//  size(800, 800);
  println("The height is"+height);
  box2d= new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -150);
  box = new Boxy(width/2, height/2-100);
  leftWall = new Boundary(width-1,height/2,0,height);
  //  rightWall = new Boundary(width-10, height/2, 0, height);
  //  rightWall = new Boundary(50, height/2-100, 50, 50);
}



void draw() {
  background(255);
  box2d.step();
  /*    ---------------Left and right wall starts here---------------*/
  //  rightWall.display();
  fill(0);
  box.display();
  fill(0);
  line(50, height/2, width-50, height/2);


  //  println(frameRate);
}

void mousePressed() {
  box.jump();
  println("mousePressed called");
}

