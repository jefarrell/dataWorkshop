JSONObject json;

void setup() {
  size(1280,720);
  json = loadJSONObject("station.json");
  int id = json.getInt("id");
  int availableDocks = json.getInt("availableDocks");
  println(id +", ", availableDocks);
}


void draw() {
  
}
