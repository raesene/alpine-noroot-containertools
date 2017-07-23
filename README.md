Alpine Container Tools Docker Image
--

I had a need for an image with some container tools in it which doesn't run as root. So this is it :)

Based on alpine to keep the image nice and small.



Tools installed
--
openssh
nmap
curl
etcd
kubectl
docker client


Running Instructions
--
`docker run -t -d -p 2200:22 raesene/alpine-noroot-containertools`

`docker exec -it <container_name> /bin/sh`
