#!/bin/bash
ffmpeg -framerate 30 -i %04d.png -c:v libx264 -profile:v high -crf 20 -pix_fmt yuv420p secuence.mp4
