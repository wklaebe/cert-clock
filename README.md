A clock with date, day of week, and day of event.

Adjust event start in second-to-last line of cert-clock-set.py

DejaVuSansMono-Bold.ttf downloaded from dejavu-fonts.github.io and used "under a Free license".

= Dependencies

- cron
- python3
- infobeamer-pi (duh)
- screen (for running infobeamer-pi in)

= Installation

Dump this into a directory "cert-clock" in your info-beamer-pi installation.
On my RPi1 this results in:

```
/root/info-beamer-pi/cert-clock/
├── cert-clock.crontab
├── cert-clock-set.py
├── cert-clock-start.sh
├── LICENSE
├── node.lua
├── README.md
└── textclock
    ├── DejaVuSansMono-Bold.ttf
    └── node.lua
```

Start infobeamer by running cert-clock-start.sh and regularly run cert-clock-set.py,
ideally by using the provided cert-clock.crontab.
