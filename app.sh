#!/bin/sh
echo "===================================="
echo "MyApp container started successfully"
echo "Build Time: $(date)"
echo "Hostname: $(hostname)"
echo "===================================="

# Keep container running
tail -f /dev/null

