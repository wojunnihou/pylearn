#!/usr/bin/python
#-*- coding: utf-8 -*-
import socket
import fcntl
import struct

def get_ipgrains():

    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    ipstr = socket.inet_ntoa(fcntl.ioctl(
        s.fileno(),
        0x8915,
        struct.pack('256s', "eth0")
    )[20:24])
    
    return {
              "ipstr":ipstr
           }

if __name__ == '__main__':
   
    print(get_ipgrains())
