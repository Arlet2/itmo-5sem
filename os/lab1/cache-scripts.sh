#!/bin/bash
sudo perf stat -e l3_request_g1.caching_l3_cache_accesses -ddd stress-ng --cache 10 --cache-level $i --prefetch-l3-size $j -t 5s
