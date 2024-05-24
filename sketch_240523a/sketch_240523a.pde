PImage img;

void setup() {
  size(866,268);
  img = loadImage("dark.jpg");
  for (int i = 0; i < image.height; i++){
    for (int j = 0; j < image.width; j ++){
      color c = img.pixels[i + j];
      if (c != image.pixels[i+j+1]){
        println(c);
      }
    }
  }
  
}

void draw() {
  image(img, 0, 0);
}
