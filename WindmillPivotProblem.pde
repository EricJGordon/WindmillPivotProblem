//array of PVectors?
int degrees = 0;

void setup(){
  size(700, 500);
  background(0);
  
  //fill array with dozen or so random points
  
  strokeWeight(8);
  stroke(#77CCFF);  //light blue
  
  
  point(230, 220);  //temporary
  point(385, 120);
  point(285, 275);
  point(230, 275);
  
  
  //ensure none colinear (using PValue.angleBetween?)
}

void angledContinuousLine(float x, float y, float angle){
  
  //maths to calculate x1, y1, x2, y2, where line intersects borders of window
  
  //starting off just attempting to make a line segment at given angle from given point
  
  float segmentLength = 100;
  float x1 = x, y1 = y, x2, y2;
  
  x2 = x1 + cos(radians(angle))*segmentLength;
  y2 = y1 + sin(radians(angle))*segmentLength;
  
  
  //end goal: use existing line drawing function
  line(x1, y1, x2, y2 );
}

void draw(){
    
    strokeWeight(3);
    stroke(degrees%255);  
    angledContinuousLine(385, 120, degrees++);
  
  //increment angle
  //if line hits another pivot, switch to it
}
