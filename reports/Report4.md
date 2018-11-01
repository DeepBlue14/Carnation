# Report #4
=====

### **Progress Report**
I primarily worked on client-side implementation.  Here are a few highlights:

**HTML/CSS**
I created a number of HTML/CSS files to get the client-side general structure
set up.

**JavaScript and Asynchronous Functions**
One of the primary issues I've been running into is that most JavaScript
functions (e.g. reading an image from disk) are asynchronous operations.  I
understand the usefullness of this from an end-user perspective, but it
certainly complicates things from a development standpoint.  Especially since
this is very different to the way it is usually done in C++/Python, etc.


**Rapid Navigation Algorithms**
I've done a literature review to find algorithms for efficiently finding an
optimal path between start and goal points.  Google have published some
interesting and relevant papers (related to Google Maps), and some other
companies and organizations involved with GPS devices have done likewise.

I will most likely use a variation of the "A*" algorithm, since it is fairly
rapid, and not overly complicated to implement.
