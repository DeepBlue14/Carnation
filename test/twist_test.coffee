##
#
#
##

Pose = require './../src/geometry_msgs/Pose.coffee'



mypt = new Pose.Pose(1.0, 2.0, 3.0, 10.0, 20.0, 30.0, 40.0)

console.log 'hello ' + mypt.position.x

