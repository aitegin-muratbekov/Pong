class Skill2p {
  // State
  float x, y;
  float w, h;
  float w2;
  int colour = 255;
  int colour2 = 0;
  boolean skill2p = false;

  // Behaviour
  Skill2p(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  void lineMove() {    
    fill(colour);
    rect(x, y, w2, h);

    if (colour == 255) {
      if (w2 <= w) {
        w2 += 0.1;
        if (w2 >= w) {
          colour = colour2;
        }
      }
    } else if (colour == colour2) {     
      if (keyCode == RIGHT) {
        if (w2 > 0) { 
          skill2p = true;
          w2 -= 3.5;
        } else if (w2 <= 0) {
          skill2p = false;
          colour = 255;
          keyPressed = false;
        }
      }
    }
  }                 
  void draw() {
    stroke(255);
    fill(0xFFFF0000);
    rect(x, y, w, h);
  }
}
