#!/bin/bash
stress-ng --mcontend $i --misaligned-method $j -t 5s | sar -t 1 5 -r
