# Script to clean docker images
# Usage in cron: 
# 0 0 * * * sh /home/ubuntu/iac/scripts/clean.sh
# --------------------------------------------------------------------------------

KEEP_NEWEST=5

# remove all stopped containers
docker ps -a | awk '/Exit/ {print $1}' | xargs -r docker rm

# remove all untagged images
docker images | awk '/<none>/ {print $3}' | xargs -r docker rmi

# remove old version images (keep 2 version)
docker images | egrep -e "backend" | tail -n +$(( KEEP_NEWEST + 1 )) | awk '{print $3}' | xargs -r docker rmi -f
docker images | egrep -e "frontend" | tail -n +$(( KEEP_NEWEST + 1 )) | awk '{print $3}' | xargs -r docker rmi -f
