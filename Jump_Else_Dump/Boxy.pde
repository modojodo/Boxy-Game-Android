class Boxy {

  float w=0.05*width, h=w;
  float x, y;
  Body body;
  Vec2 jumpRight;
  Vec2 jumpLeft;
  int halfWidth= width/2;
  int halfHeight =height/2;
  final float Y_VELOCITY= 0.10*halfHeight;
  final float X_VELOCITY=0.05*width;
  float yJump=Y_VELOCITY;
  float xJump=X_VELOCITY;
  float pullDown;

  public Boxy( float _x, float _y) {
    x=_x;
    y=_y;

    BodyDef bd = new BodyDef();
    //    bd.setLinearVelocity(new Vec2(0, 3));
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    bd.bullet=true;

    bd.type=BodyType.DYNAMIC;
    body=box2d.createBody(bd);
    PolygonShape ps = new PolygonShape();

    //[full] Box2D considers the width and height of a rectangle to be the distance from the center to the edge (so half of what we normally think of as width or height).
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
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
    //    body.setAngularVelocity(0);
    jumpRight= new Vec2(xJump, yJump);
    jumpLeft= new Vec2(-xJump, yJump);
  }

  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);

    float a = body.getAngle();
    stroke(0);
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

  float jump() {
    Vec2 boxPos = box2d.getBodyPixelCoord(body);  

    if (boxPos.y<halfHeight) {
      jumpRight.y=0;
      jumpLeft.y=0;
      jumpRight.x=0;
      jumpLeft.x=0;
    } else if (Y_VELOCITY>=Math.abs((boxPos.y-(h/2))-halfHeight-(0.05*height))) { // subtracting the halfHeight  with the height of the slab and boxPos.y with the height of the box
      float x = Math.abs((boxPos.y-(h/2))-(halfHeight-(0.05*height)));
      pullDown= Math.abs(Y_VELOCITY-Math.abs((boxPos.y-h)-halfHeight));
      yJump=x;      
      jumpRight.y=yJump;
      jumpLeft.y=yJump;
      jumpRight.x=X_VELOCITY;
      jumpLeft.x=-X_VELOCITY;
      if (mouseX>  halfWidth) {
        body.setLinearVelocity(jumpRight);
      } else if (mouseX< halfWidth) {
        body.setLinearVelocity(jumpLeft);
      }

      println("jumpRight.y: "+jumpRight.y+" jumpLeft.y: "+jumpLeft.y);
      println("box position difference with target: "+Math.abs((boxPos.y)-halfHeight));
      return pullDown;
    } else {
      pullDown=0;
      yJump=Y_VELOCITY;      
      jumpLeft.y=Y_VELOCITY;
      jumpRight.y=Y_VELOCITY;
      jumpRight.x=X_VELOCITY;
      jumpLeft.x=-X_VELOCITY;
      if (mouseX>  halfWidth) {
        body.setLinearVelocity(jumpRight);
      } else if (mouseX< halfWidth) {       
        body.setLinearVelocity(jumpLeft);
      }
      println("jumpRight.y: "+jumpRight.y+" jumpLeft.y: "+jumpLeft.y);
      println("box position difference with target: "+Math.abs((boxPos.y-h)-halfHeight));
    }
    return pullDown;
  }
}

