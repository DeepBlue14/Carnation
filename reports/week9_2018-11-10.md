# Report #9
=====

### **Progress Report**
While demoing some of my code to a friend, he pointed out that finding an
optimal (or indeed efficient) path on campus was directly relient on traffic.

Since this seemed to me to be a valid and extremely interesting point, I've
begun integrating a primitive traffic simulation.  That is, people can be
spawned into the map at random locations, and the search algorithm will take
this into consideration when planning.

How much traffic exists is dependent on the date and time.  For example, there
will be many more people wandering around on a Monday at 11:00am then on
a Sunday at 11:00pm.  This data is collected using the JavaScript Date class.

See Traffic.coffee and traffic_test.coffee for more details.
