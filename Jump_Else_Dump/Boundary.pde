public class Boundary {
  float x, y, w, h;
  Body boundary;
  Boundary(float _boundX, float _boundY, float _bWidth, float _bHeight) {
    w = _bWidth;
    h = _bHeight;
    x=_boundX;
    y=_boundY;
    // Build body.
    BodyDef bound = new BodyDef();
    bound.type = BodyType.STATIC; 
    bound.position.set(box2d.coordPixelsToWorld(x, y));

    boundary = box2d.createBody(bound);

    // Build shape.
    PolygonShape bs = new PolygonShape();   
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);

    bs.setAsBox(box2dW, box2dH);

    FixtureDef fb= new FixtureDef();
    fb.shape= bs;
    fb.friction=0.3;
    fb.restitution=0.5;
    fb.density=1;

    boundary.createFixture(fb);
  }
  void display() { 
    Vec2 boxPos= box2d.getBodyPixelCoord(boundary);
    fill(0);
    stroke(0);
    rectMode(CENTER);
    rect(boxPos.x, boxPos.y, w, h);
  }
} 

