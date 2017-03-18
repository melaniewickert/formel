from goprohero import GoProHero
import time
print 'is this working'
camera=GoProHero(password='Tanganyika123')
print 'is this working 2'
camera.command('record', 'on')
time.sleep(900)
camera.command('record','off')

