![Logo](https://github.com/DeepBlue14/Carnation/blob/master/res/image/marigold_icon.png)

# Carnation -- Internet and Web Systems Fall 2018


*Author/Maintainer:* James Kuczynski,  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Graduate Researcher,  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Robotics Laboratory][1],  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[University of Massachusetts Lowell][2].  
*Email:* jkuczyns@cs.uml.edu

=====


### **Project Synopsis**
This repository contains my project for graduate Internet and Web Systems I at
UMass Lowell, taught by Dr. Haim Levkowitz.


### **Introduction**
Those who have visited the University of Massachusetts Lowell North campus 
may be impressed by the various styles and architectures which are encompassed
by the many buildings, spanning from the 1930s to modern times.  However, one
might also rapidly become lost while trying to navigate the labyrinth of halls,
classrooms, and tunnels.

It is this problem which I propose to solve.  This project will consist of a
web app (post likely a HTML web page) in which a person can enter their, 
relative location on campus, e.g. "Dandeneau Hall, room 409", and a desired
destination in a similar fashion.  The application will then use the
universities floorplans to determine the most efficient way to traverse from
the current location to to the goal location, and provide instructions.

**In essence, this is akin to an in-door version of Google Maps on a micro scale.**


### **Access**
You can access this project live using [this link to the web site on weblab][4]


### **Resources**
**Floorplans**
I have aquired a copy of the universities floor plans (with the
exception of Dandeneau and Perry halls) from the facilities department.

**Design & Implementation Notes**
The server-side is developed in CoffeeScript using Node.js.  The client-side
is a combination of CoffeeScript, HTML, and CSS.

Many of the data structures used where inspired by [ROS][3].


### **Install & Run**
First, install NodeJS and NPM.  Then
```
git clone https://github.com/DeepBlue14/Carnation.git
npm i coffee-script
```

To run tests, ```cd``` to the tests directory, and run
```
coffee [filename].coffee
```


### **Acknowledgements**
This work is a class project guided by Dr. Haim Levkowitz.



<!--links-->

[1]: http://robotics.cs.uml.edu/
[2]: http://www.uml.edu/
[3]: http://www.ros.org/
[4]: http://www.cs.uml.edu/~jkuczyns/513_f2018/Carnation/public/index.html
[5]: http://weblab.cs.uml.edu/~jkuczyns/513_f2018/Carnation/
[6]: http://weblab.cs.uml.edu/~jkuczyns/513_f2018/Carnation/public/index.html
