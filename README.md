# Internet and Web Systems Fall 2018
=====

### **Project Synopsis**
This repository contains my project for graduate Internet and Web Systems I at
UMass Lowell, taught by Dr. Haim Levkowitz.

### **Introduction**
Those who have visited the University of Massachusetts Lowell North campus 
may be impressed by the various styles and architectures which are encoumpased
by the many buildings, spanning from the 1930s to modern times.  However, one
might also rapidly become lost while trying to navigate the labyrinth of halls,
classrooms, and tunnels.

It is this problem which I propose to solve.  This project will consist of a
web app (post likely a HTML web page) in which a person can enter their, 
relative location on campus, e.g. "Dandeneau Hall, room 409", and a desired
destination in a similar fashion.  The application will then use the
universities floorplans to determine the most efficient way to traverse from
the current location to to the goal location, and provide instructions.

In essence, this is akin to an in-door version of Google Maps on a micro scale.


### **Implementation**
**Floorplans**
I have aquired a copy of the universities floor plans (with the
exception of Dandeneau and Perry halls) from the facilities department.

**Programming Language(s)**
I am currently in the process of determining how best to implement this system.
My original plan was to implement a server using Node.js.  However, I am
considering switching to Ruby On Rails, since it appears to be slightly easier.

I will continue researching these two options, and would appreciate any advice
my classmates and Dr. Haim may have.


### **Install & Run**
```
npm install --save Carnation
npm install pngjs --save
```

### **Acknowledgements**
This work is a class project guided by Dr. Haim Levkowitz.
