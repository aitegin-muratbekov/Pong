class Net {
  // State
  int x, y, w, h;
  int width = 1920;
  
  // Behaviour
  Net() {
    x = width / 2;
    y = 100;
    w = 6;
    h = 10;
  }
  void draw() {    
    for(int y = this.y; y < height; y += h * 2) {
      noStroke();
      fill(255);
      rect(x, y, w, h);
    }
  }  
}
