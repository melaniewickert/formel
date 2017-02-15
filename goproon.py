from goprohero import GoProHero
import time
camera=GoProHero(password='Tanganyika123')
camera.command('record', 'on')
time.sleep(600)
camera.command('record','off')

