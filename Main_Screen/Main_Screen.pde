float titleRectWidth;
float titleRectHeight;
float titleFontSize;
float titleRectY;
float center;
float titleRectGap;
float subFontSize; //font size of the sub blocks
float subBlocksWidth;
float subBlocksHeight;
float subBlockGap;
float colorButtonX;
float colorButtonY;
float colorButtonSize;
int counter;
String background;
int colorButtonColor;
float textColor;
void setup() {
  smooth();
  noStroke();

  size(600, 700);
  titleRectWidth=0.75*width;
  titleRectHeight=0.10*height;
  titleFontSize=0.50*titleRectHeight;
  titleRectY=0.10*height;
  center=width/2;
  subFontSize=0.15*titleRectWidth/2;
  subBlocksWidth=titleRectWidth/2;
  subBlocksHeight=titleRectHeight-0.20*titleRectHeight;
  subBlockGap=0.10*height;
  colorButtonX=width-0.90*width;
  colorButtonY= height-0.10*height;
  colorButtonSize= 0.10*width;
  counter=0;
  background= "white";
  colorButtonColor= 0;
  textColor=255;
  background(255);
  rectMode(CENTER);
}

void draw() { 
  noStroke();

  fill(255, 130, 46);
  rect(center, titleRectY, titleRectWidth, titleRectHeight, 10);
  textAlign(CENTER);
  textSize(titleFontSize);
  fill(textColor);
  text("AMAZING BOXY", center, titleRectY+(titleRectY/2)/2);

  /* Starting the sub-blocks*/


  titleRectGap=titleRectY+0.25*height;
  fill(224, 45, 222);
  rect(center, titleRectGap, subBlocksWidth, subBlocksHeight, 10);
  fill(textColor);
  text("Play", center, titleRectGap+(subBlocksHeight/2)/2);
  titleRectGap=titleRectGap+subBlockGap;
  fill(255, 81, 96);
  rect(center, titleRectGap, subBlocksWidth, subBlocksHeight, 10);
  fill(textColor);
  text("Mode", center, titleRectGap+(subBlocksHeight/2)/2);
  titleRectGap=titleRectGap+subBlockGap;
  fill(122, 247, 240);
  rect(center, titleRectGap, subBlocksWidth, subBlocksHeight, 10);
  fill(textColor);
  text("Score", center, titleRectGap+(subBlocksHeight/2)/2);
  titleRectGap=titleRectGap+subBlockGap;
  fill(174, 245, 114);
  rect(center, titleRectGap, subBlocksWidth, subBlocksHeight, 10);
  fill(textColor);
  text("Shape", center, titleRectGap+(subBlocksHeight/2)/2); 
  titleRectGap=titleRectGap+subBlockGap;
  fill(252, 245, 59);
  rect(center, titleRectGap, subBlocksWidth, subBlocksHeight, 10);
  fill(textColor);

  text("Exit", center, titleRectGap+(subBlocksHeight/2)/2);

  //a circle shape to change the background color
  fill(colorButtonColor);
  stroke(colorButtonColor);
  strokeWeight(10);
  ellipse(colorButtonX, colorButtonY, colorButtonSize, colorButtonSize);
}

boolean detectColorChange() {
  if ((mouseX >colorButtonX-colorButtonSize/2 &&  mouseX<colorButtonX+colorButtonSize/2) && (mouseY >colorButtonY-colorButtonSize/2 &&  mouseY<colorButtonY+colorButtonSize/2)) {
    return true;
  }
  return false;
}

void mousePressed() {
  counter=counter+1;
  if (detectColorChange()==true && background== "white") {
    background(0);
    textColor=0;
    colorButtonColor=255;
    background="black";
  } else  if (detectColorChange()==true && background== "black") {
    background(255);
    textColor=255;
    colorButtonColor=0;
    background="white";
  }

  if ((mouseX>center-subBlocksWidth/2 && mouseX<center+subBlocksWidth/2) && (mouseY>titleRectGap-subBlocksHeight/2 && mouseY<titleRectGap+subBlocksHeight/2) ) {
    println("play pressed");
  }
}

