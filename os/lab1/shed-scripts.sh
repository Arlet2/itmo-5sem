#!/bin/bash
stress-ng --resched $i --sched-period $j -t 5s --metrics | sar -t 1 5