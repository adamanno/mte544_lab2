## MTE544 - Lab 2 - Particle Filter With the TurtleBot4 ##

### Dependencies ###

- Requires MATLAB 2022b
- Requires the MATLAB ROS Toolbox
- Requires the MATLAB Navigation Toolbox

### Use Instructions ###

Restore the geometry2 submodule as needed.  The MATLAB command ros2buildmsg(dir) will occasionally fail to build the gometry2 directory.  

Start a new terminal session in the mte544_lab2 repo and call the following git commands:
'''
$ cd geometry2
$ git clean -df
'''

This command deletes (necessary) local files generated by MATLAB to read ROS2 topics not included in the MATLAB ROS2 toolbox.

Then call:
'''
$ git status
'''

There should be no modified files.

In the MATLAB integrated terminal call the following command:
'''
$ ros2genmsg('geometry2')
'''
This command rebuilds the ROS2 messages MATLAB needs to read a ROS2 bag (.db3) file.
