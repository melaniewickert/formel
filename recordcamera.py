from goprohero import GoProHero

import time
import sys
print 'is this working'
camera=GoProHero(password='Tanganyika123')

while True:
    if time.localtime().tm_hour == 8 or time.localtime().tm_hour == 11 or \
	  time.localtime().tm_hour == 14 or time.localtime().tm_hour == 17:
        if 40 <= time.localtime().tm_min and record==False:
            camera.command('record', 'on')
            record = True
            sys.stdout.write('started recording @:',time.asctime(time.localtime()))
        elif time.localtime().tm_min > 50:
        	camera.command('record', 'off')
        	record = False
        	sys.stdout.write('stopped recording @:',time.asctime(time.localtime()))
        else:
        	pass
    else:
    	pass
