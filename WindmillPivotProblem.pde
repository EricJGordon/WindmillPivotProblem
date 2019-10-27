int degrees = 0;
int currentPoint;
ArrayList<PVector> points = new ArrayList<PVector>();

void setup(){
  size(700, 500);
  background(0);
  
  strokeWeight(8);
  stroke(#77CCFF);  //light blue
  
  points.add(new PVector(385, 120));  // will ultimately be randomly generated, 
  points.add(new PVector(230, 220));  // and/or option of user selecting their own
  points.add(new PVector(285, 275));  
  points.add(new PVector(230, 275));  
    
  //ensure none colinear (using PValue.angleBetween?)

  currentPoint = 0;
}

void angledContinuousLine(PVector p, float angle){
  
  float segmentLength = (float)Math.sqrt(700*700+500*500);
  float x1 = p.x, y1 = p.y, x2, y2, x3, y3;
  
  x2 = x1 + cos(radians(angle))*segmentLength;
  y2 = y1 + sin(radians(angle))*segmentLength;
  x3 = x1 + cos(radians(angle+180))*segmentLength;
  y3 = y1 + sin(radians(angle+180))*segmentLength;
  
  line(x1, y1, x2, y2);
  line(x1, y1, x3, y3);
}

void draw(){
    background(0);
    strokeWeight(8);
    stroke(#77CCFF);  //light blue
    
    for(PVector p: points){
      point(p.x, p.y); 
    } 
    
    strokeWeight(3);
    stroke(degrees%200+50);  
    angledContinuousLine(points.get(currentPoint), degrees++);
  
  //increment angle
  //if line hits another pivot, switch to it, i.e. change currentPoint
}
