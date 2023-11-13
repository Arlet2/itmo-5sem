#!/bin/bash
stress-ng --iomix $i --ioprio $j -t 5s | iostat -h -x -t 1
