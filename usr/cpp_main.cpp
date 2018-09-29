/*
 * cpp_main.c
 *
 *  Created on: Jun 10, 2018
 *      Author: Itamar Eliakim
 */

#include <cpp_main.h>
#include "main.h"
#include "stm32f1xx_hal.h"
#include "ringbuffer.h"
#include "ros.h"
#include "std_msgs/String.h"
#include "std_msgs/Int16.h"
#include "nbt.h"
#include "geometry_msgs/Twist.h"

extern uint8_t RxBuffer[RxBufferSize];
struct ringbuffer rb;

ros::NodeHandle nh;
std_msgs::String str_msg;

extern "C" void messageCb(const geometry_msgs::Twist& msg);
ros::Publisher chatter("version", &str_msg);
ros::Subscriber<geometry_msgs::Twist> sub("twist_cmd", messageCb);

static nbt_t publish_nbt;
static nbt_t ros_nbt;


extern "C" void messageCb(const geometry_msgs::Twist& msg)
{
		//Fill subscriber
}

extern "C" void cdc_receive_put(uint8_t value)
{
	ringbuffer_putchar(&rb, value);
}

extern "C" void init_ROS()
{
	ringbuffer_init(&rb, RxBuffer, RxBufferSize);

	// Initialize ROS
	nh.initNode();

	nh.advertise(chatter);
	nh.subscribe(sub);

	NBT_init(&publish_nbt, 500);
	NBT_init(&ros_nbt, 10);
}

extern "C" void version_handler()
{
	  if (NBT_handler(&publish_nbt))
	  {
		  char version[] = "version: 0.2";
		  str_msg.data = version;
		  chatter.publish(&str_msg);

	  }
}


extern "C" void spinOnce()
{
	  if (NBT_handler(&ros_nbt))
	  {
		nh.spinOnce();
	  }
}

