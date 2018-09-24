ROS_stm32f1_rosserial_USB_VCP
------------------------

<p align="center">
<img src="https://github.com/Itamare4/Thesis/blob/master/MD_Images/stm32_front.jpg?raw=true" height="200" width=auto>
<img src="https://github.com/Itamare4/Thesis/blob/master/MD_Images/ros_terminal.png?raw=true" height="200" width=auto>
</p>

### Brief ###
Rosserial interface based on USB VCP for STM32F103C8, ported from from stm32F4 rosserial UART repo - https://github.com/johnsonzzd/rosserial_stm32_NucleoF411<br>
Works with ROS kinetic distro.

### Changelog ###
* 0.1 -
JTAG Debug on board works, only works with one publisher / subscriber.<br>
*ERROR* - "Tried to publish before configured, topic id 105" on publisher and subscriber together, will be fixed on next version.

### HOW-TO ###
* Solder 1.5K pull-up resistor between PA12 and 3.3v.
<p align="center">
<img src="https://github.com/Itamare4/Thesis/blob/master/MD_Images/stm32_back.jpg?raw=true" height="400" width=auto>
</p>

* Connect JTAG pins on the STM32F103C8 to Nucleo board or st-link
<p align="center">
<img src="https://github.com/Itamare4/Thesis/blob/master/MD_Images/stm32_debugger.jpg?raw=true" height="200" width=auto>
</p>

* Burn the firmware using systemworkbench AC6,
	Cubemx version - 4.25.1
	HAL Version - F1 v1.6.1
* Debug works thanks to currect .cfg file, publish to topic from ROS side, and check the results on the MCU debugger side
* run the following commands (from the original git by johnsonzzd) -
```
   	1st terminal. roscore
	2nd terminal. rosrun rosserial_python serial_node.py _port:=/dev/ttyACM0
	3rd terminal. rostopic list 、 rostopic echo /version
```

Notice: Baudrate on VCP protocol is determine by the host(MCU), no need to set it as parameter on rosrun...

It is better to generate you own ros_lib on your system to get all your messeages, do the following - 
```
   	cd <sketchbook>/libraries
   	rm -rf ros_lib
   	rosrun rosserial_arduino make_libraries.py .
``` 
and copy ros_lib to the systemworkbench project folder.

### About ###
Itamar Eliakim<br>
M.Sc Robotics Engineer, Tel Aviv, Israel<br>
Email - Itamare@gmail.com


