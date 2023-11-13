#!/bin/bash
stress-ng --sigpipe $i -t 5s --metrics | sar -t 1 5