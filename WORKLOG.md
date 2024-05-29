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

HW: 


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

info
