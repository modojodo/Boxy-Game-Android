class Boundary {
  Body boundary;
  float bWidth, bHeight, boundX, boundY;
  Boundary(float _boundX, float _boundY, float _bWidth, float _bHeight) {
    boundX=_boundX;
    boundY=_boundY;
    bWidth=_bWidth;
    bHeight=_bHeight;


    BodyDef bo = new BodyDef();
    bo.type=BodyType.STATIC;
    bo.position.set(box2d.coordPixelsToWorld(boundX, boundY));
    boundary= box2d.createBody(bo);

    PolygonShape bs = new PolygonShape();
    float w= box2d.scalarPixelsToWorld(bWidth);
    float h= box2d.scalarPixelsToWorld(bHeight);
    bs.setAsBox(w, h);

    FixtureDef fb= new FixtureDef();
    fb.shape= bs;
    fb.friction=0.3;
    fb.restitution=0.5;
    fb.density=1;

    boundary.createFixture(fb);
  }

  void display() {
    Vec2 boundPos = box2d.getBodyPixelCoord(boundary);

    pushMatrix(); 
    translate(boundPos.x, boundPos.y);  
    fill(0);   
    rectMode(CENTER);   
    rect(0, 0, bWidth, bHeight);
    popMatrix();
  }
}


