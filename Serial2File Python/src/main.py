import serial
import time

#Open file for writing
f=open('sensordata.txt','w')
i=0

#Connect to Arduino
try:
    print '\nConnecting to Arduino....'
    ser=serial.Serial('/dev/tty.usbmodem621', 9600)
    time.sleep(2)
except:
    print 'Error connecting to Arduino!'
    
#Read from Arduino
try:
    print '\nAttempting to read from Arduino....'
    val=ser.read(ser.inWaiting())
    ser.close()
    ser=serial.Serial('/dev/tty.usbmodem621', 9600)
    time.sleep(2)
    while True:
        val=ser.readline()
        print val
        if val[0]=='R':
            f.close()
            f=open('sensordata.txt','w')
        f.write(str(val))
        f.close()
        f=open('sensordata.txt','a')
        
except:
    print 'Unable to read data!'
    ser.close()
    f.close()
