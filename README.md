Alpine Container Tools Docker Image
--

I had a need for an image with some container tools in it which doesn't run as root. So this is it :)

Based on alpine to keep the image nice and small. We've got some tricks which are embedded into the image and could be useful.

There's a SetUID root bash shell at `/bin/setuidbash` invoke with `/bin/setuidbash -p` to get to root (unless the container blocks privilege escalation)
The busybox binary also has all the default Docker capabilities added to it, so you can do things like change permissions on files owned by root :)



Tools installed
--
- nmap
- curl
- etcd
- kubectl
- docker client
- boltbrowser
- oc
- amicontained


Running Instructions
--
`docker run -it raesene/alpine-noroot-containertools /bin/sh`
