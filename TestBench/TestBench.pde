void setup() {

  size(800, 600);
  background(255);
  frameRate(2);
}

int gap;
int firstX, firstY, firstWidth, firstHeight; 
int secondStart, secondX, secondY, secondWidth, secondHeight;
void draw() {
  background(255);


  firstWidth=int(random(0.15*width, 0.70*width));
  firstX=firstWidth/2;
  firstY=60;

  firstHeight=20;
  fill(0);
  rectMode(CENTER);
  rect(firstX, firstY, firstWidth, firstHeight);

  //The gap between the both slabs
  gap=int(0.15*width);

  secondStart=firstWidth+gap;
  secondWidth= width-secondStart;
  secondHeight=20;
  secondX= secondStart+(secondWidth/2);
  secondY=60;
  rect(secondX, secondY, secondWidth, secondHeight);
}

