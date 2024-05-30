PImage img;

void setup() {
  size(400, 400);
//size(288, 180);
  img = createImage(width, height, RGB);
  img.loadPixels();
}

void draw() {
  background(255);
  fill(0, 0, 255); 
  textSize(30);
  text("this should be blue", 20, height/2);
  img = get();
  image(img, 0, 0);
  save("blue_text.png");
//  save("white.png");
}
