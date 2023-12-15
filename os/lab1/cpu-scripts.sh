#!/bin/bash
stress-ng --cpu $i --cpu-method int128float -t 15s --metrics | sar 1 15
stress-ng --cpu $i --cpu-method float32 -t 15s --metrics | sar 1 15