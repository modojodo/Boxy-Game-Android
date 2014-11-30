class Boxy {

  float w, h;
  float x, y;
  Body body;
  Vec2 jumpRight;
  Vec2 jumpLeft;
  int halfWidth= width/2;
  int halfHeight =height/2;

  public Boxy( float _x, float _y) {
    w=40;
    h=40;
    x=_x;
    y=_y;

    BodyDef bd = new BodyDef();
    //    bd.setLinearVelocity(new Vec2(0, 3));
    bd.position.set(box2d.coordPixelsToWorld(x, y));

    bd.type=BodyType.DYNAMIC;
    body=box2d.createBody(bd);
    PolygonShape ps = new PolygonShape();

    //[full] Box2D considers the width and height of a rectangle to be the distance from the center to the edge (so half of what we normally think of as width or height).
    float box2dW = box2d.scalarPixelsToWorld(w);
    float box2dH = box2d.scalarPixelsToWorld(h);
    //[end]
    ps.setAsBox(box2dW, box2dH);


    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 1;
    // Set physics parameters.
    fd.friction = 0.3;


    // Attach the Shape to the Body with the Fixture.
    body.createFixture(fd);
    //    body.setLinearVelocity(new Vec2(100, 0));
    //    body.setAngularVelocity(12);
    jumpRight= new Vec2(10, 90);
    jumpLeft= new Vec2(-10, 90);
  }

  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);

    float a = body.getAngle();

    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    fill(0);    
    rectMode(CENTER);
    rect(0, 0, w, h);
    popMatrix();
  }
  void killBody() {
    box2d.destroyBody(body);
  }
  void jump() {

//    Vec2 boxPos = box2d.getBodyPixelCoord(body);
    //left  side screen control
    //    if (mouseX<halfWidth) {
    //      if (boxPos.y-90< halfWidth) {
    //        float ylimit=halfWidth-boxPos.y;
    //        jumpLeft.y=ylimit;
    //        body.setLinearVelocity(jumpLeft);
    //      } else {
    //        jumpLeft.y=90;
    //        body.setLinearVelocity(jumpLeft);
    //      }
    //    } else  if (mouseX>halfWidth) {
    //
    //      if (boxPos.y-90< halfWidth) {
    //        float ylimit=halfWidth-boxPos.y;
    //        jumpRight.y=ylimit;
    //        body.setLinearVelocity(jumpRight);
    //      } else {
    //        jumpRight.y=90;
    //        body.setLinearVelocity(jumpRight);
    //      }
    //    }





    if (mouseX>  halfWidth) {

      body.setLinearVelocity(jumpRight);
    } else if (mouseX< halfWidth) {

      body.setLinearVelocity(jumpLeft);
    }
  }
}

