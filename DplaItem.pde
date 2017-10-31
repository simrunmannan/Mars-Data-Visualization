// Each result is used to create a DplaItem
class DplaItem {
  float x, y;
  float diameter;
  String displayTxt;
  boolean over = false;
  JSONObject jsonParent;
  JSONObject sr;
  boolean unpause = true;
  float changeX = random(.1,1);
  float changeY = random(.1,1);
  float bufferX = 1.0;
  float bufferY = 1.0;
  float boundxU = x + (bufferX/100);
  float boundxL = x - (bufferX/-10);
  float boundyU = y + (bufferY/100);
  float boundyL = y - (bufferY/-10);
  // Constructor
  public DplaItem(JSONObject j) {
    x = random(0, width);
    y = random(0, height);
    diameter = 10;

    // Original JSONObject
    jsonParent = j;
    
    // Nested JSONObject that contains useful information
    sr = SourceResource();
    
    // Modify this to determine what is revealed in mouseOver
    displayTxt = getTitle();
  }

  // Return original URL of item
  public String getItemURL() {
    String shownAt = jsonParent.getString("isShownAt");
    println(shownAt);
    return shownAt;
  }

  // Get inside SourceResource (Where a lot of useful info resides)
  public JSONObject SourceResource() {
    JSONObject source = jsonParent.getJSONObject("sourceResource");
    return source;
  }

  // Return Title
  public String getTitle() {
    try {
      return sr.getString("title");
    } 
    catch (Exception e) {
      String s = "No Title Provided";
      return s;
    }
  }

  // CHecking if mouse is over the Entry
  void rollover(float px, float py) {
    float d = dist(px, py, x, y);
    if (d < diameter/2) {
      over = true;
    } else {
      over = false;
    }
  }

  // Display the Entry
  void display() {
    noStroke();
    fill(255,255,204);
    ellipse(x, y, 8,8);
    stroke(255,85,0,60);
    line(x,y,300,350);
    
    
      if (over) {
      fill(255);
      textAlign(LEFT);
      text(displayTxt, x, y);
      noFill();
      stroke(255);
      ellipse(x,y,15,15);
    }

     //changeX= changeX+.0005;
     //changeY=changeY+.5;

  
        if (((x) > (width+10) || (x ) < (-10)) && ((x + changeX) > (boundxU) || (x + changeX) < (boundxL))) {
        changeX = -changeX;
    }
      if (((y) > (height+10) || (y) < (-10))&&((y + changeY) > (boundyU) || (y + changeY) < (boundyL))) {
        changeY = - changeY;
     } 
      x = x + changeX;
     
      if (mousePressed) {
      if (over) {
        link(getItemURL());
      }
      }
}
}

