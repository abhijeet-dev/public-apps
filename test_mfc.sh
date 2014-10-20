#!/bin/sh
cd v4l2-mfc-encoder && make
cd ..
cd v4l2-mfc-example && make
cd ..

# Construct and encode a 1080p stream
./v4l2-mfc-encoder/mfc-encode -o test_mfc.h264 -m /dev/video1 -c h264,header_mode=1 -s1920x1080 -d 1000
# Decode the stream encoded above
./v4l2-mfc-example/v4l2_decode -c h264 -d /dev/fb0 -f /dev/video3 -m /dev/video0 -i test_mfc.h264

