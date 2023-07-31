#!/usr/bin/env python3

import datetime, locale, os, socket
from dateutil import tz

for n in ['LC_ALL', 'LC_TIME', 'LANG']:
    if n in os.environ:
        try:
            locale.setlocale(locale.LC_TIME, os.environ[n])
            break
        except:
            pass

now = datetime.datetime.now(tz.gettz('Europe/Berlin'))

since_midnight = (
    now - 
    now.replace(hour=0, minute=0, second=0)
).seconds

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.sendto('cert-clock/time/set:{:d}'.format(since_midnight).encode('ascii'), ('127.0.0.1', 4444))
sock.sendto('cert-clock/date/set:{:s}'.format(now.strftime('%Y-%m-%d')).encode('ascii'), ('127.0.0.1', 4444))

locale.setlocale(locale.LC_TIME, 'de_DE.UTF-8')
dow_de = now.strftime('%A')

locale.setlocale(locale.LC_TIME, 'en_US.UTF-8')
dow_en = now.strftime('%A')

sock.sendto('cert-clock/dow/set:{:s}/{:s}'.format(dow_de,dow_en).encode('ascii'), ('127.0.0.1', 4444))

doe = now.date() - datetime.date(2023,8,15)

sock.sendto('cert-clock/doe/set:Tag/Day {:d}'.format(doe.days).encode('ascii'), ('127.0.0.1', 4444))
