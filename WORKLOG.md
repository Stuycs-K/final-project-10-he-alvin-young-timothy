# Work Log

## GROUP MEMBER 1: Alvin He

### 2024-05-22
CW: filled out base project files, experimented with stegsolve filters/planes, wrote on research doc about possible ideas,

HW: researched more about stegsolve planes and filters, added to the doc about color channels and how they are used by stegsolve

### 2024-05-23
CW: tested more with stegsolve, ran multiple images to learn the differences in plane from 0-7, brainstormed more encode ideas, made processing file and tested

HW: Ran more tests on different images, reviewed stegsolve page

### 2024-05-24
CW: tested more with stegsolve and an encoded image, started coding very small differences into images using hex

HW: got the blue plane 0 and 1 working for stegsolve on dark.png, need to start reversing the process to decode;

### 2024-05-28
CW: started workign on an encoder for blue plane, reviewed the xor encryption function

HW: got blue plane decryption working, created a text-image generator to use to encode, started lsb encryption for red

### 2024-05-29
CW: added save file to stego xor function and tested inverted image with stegsolve, tested more with red channel pixel hiding and got stegsolve red plane 0 working

HW: ran more tests with green and blue, started working on plane ranges

### 2024-05-30
CW: got plane encoding working for any plane and color, cleaned up code

HW: tested out more with the random planes and did more research on the doc, cleaned up the rgb plane encoders

### 2024-05-31
CW: out of class for trip

HW: started working on regular image encode, got encryption working with a pic of nyc on green plane 0

### 2024-06-03
CW: got regular image encode working but tints the modified image a bit, need to fix so looks identical to original

HW: fixed message hiding, worked on processing image displays, tested more color messages

### 2024-06-05
CW: incorporated XOR (image inversion) into the encoder file, cleaned up code, tested higher plane encoding

HW: worked on readme and explaining the LSB and bit intereactions of our encoder and how stegsolve uses bits in its planes

### 2024-06-07
CW: did final testing with RGB, updated readme, started working on color toggle

HW: got color toggle and plane toggles working, optimized blank background fill and blank code, got toggle xor working, added background toggles

## GROUP MEMBER 2: Timothy Young

### 2024-05-22
CW: https://docs.google.com/document/d/1Ri0hZbu2rtx6ZwQ28m5dbygn8d74uzrXJdrPIha-EJ0/edit?usp=sharing

HW:

### 2024-05-23
CW: Brainstormed more encode ideas, delved deeper into how we would implement our suggested ideas, listing pros and cons of each method.

HW: Researched how stegsolve decodes images, researched and tested the implementation of a kernel map in order to create color filters and apply/revert Gaussian blur.  

### 2024-05-24
CW: tested stegsolve with xor command, working in a seperate doc until I confirm it works and I'll transfer it over
HW: got xor to work, had a few problems with certain images. Researched canny edge detection and added to doc


### 2024-05-28
CW: Debugging the xor encryption method, fixed some errors but I still had issues by the end of class

HW: Fixed xor method and it should be completely operational, started lsb encryption for alpha mode, but unsure if I will be able to use alpha on a PImage that is initialized with RGB instead of ARGB.


### 2024-05-29
CW: worked with Alvin to brainstorm the implementation of the red filter for hidden text, which we resolved on Alvin's machine. 

HW: Tested xor implementation with different images/blank PImages, researched further about how to correctly implement alpha mode encryption  in images without alpha channels. 

### 2024-05-30
CW + HW: Tested random color filter mode on stegsolve to see if there was a way to isolate messages that only appeared on those channels, or to prevent text meant for red, green, blue or alpha from appearing in the filter.

### 2024-06-04
CW: Started Google Slides for presentation, and worked on skeleton for README 
HW: Did research about steganography's history and planes and continued to work on readme writeup. Created image folder in personal computer to keep track of possible useful images for the README presentation, will upload when complete. Continued testing random color planes


### 2024-06-05
CW: Worked on history section of modern digital steganography
HW: Completed alpha method and moved it into encoder, continued to work on google slides and creating steganographied images

