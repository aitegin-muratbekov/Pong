class Wall {
  // state
  float x, y, w, h;

  // Behaviour
  Wall() {
    x = 0;
    y = 90;
    w = score.width;
    h = 10;
  }

  void draw() {
    fill(255);
    rect(x, y, w, h);
  }
}
