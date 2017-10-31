
// An Array of Entry objects
DplaItem[] entries;

// A JSON object
JSONArray json;

void setup() {
  size(600, 600);
  loadData();
}

void draw() {
  background(0,24,72);
  for (int i = 0;  i < 100; i++) {
    noStroke();
    fill(255, 85, 0);
    smooth();
    ellipse(300,350, 25,25);
     
  }
  for (int i = 0;  i < 5; i++) {
    fill(255);
    ellipse(random(0,width),random(0,height),2,2);
  }
  
  // Display all entries
  for (int i = 0;  i < entries.length; i++) {
    if (entries[i] != null) {
      //println(entries[i].name);
      entries[i].display();
      entries[i].rollover(mouseX, mouseY);
    }
  }
}

// 
void loadData() {

    
  SearchQuery mySearch = new SearchQuery("Mars", 200);
  
 
  JSONArray JSONresults = mySearch.search();
  entries = new DplaItem[JSONresults.size()];

 
  for (int i = 0; i < JSONresults.size (); i++) {
    JSONObject rec = JSONresults.getJSONObject(i);
    DplaItem di = new DplaItem(rec);
    entries[i] = di;
  }
}