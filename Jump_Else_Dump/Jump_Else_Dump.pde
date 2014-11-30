import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;
Boxy box;

void setup() {
//  size(600, 600);
  noStroke();
  frameRate(100);


  println("The height is"+height);
  box2d= new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -150);
  box = new Boxy(width/2, height/2);
}



void draw() {

  background(255);
  box2d.step();
  fill(0);

  box.display();
}

void mousePressed() {
  box.jump();
}


