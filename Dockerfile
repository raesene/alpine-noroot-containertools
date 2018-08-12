FROM alpine:3.7

RUN apk --update add nmap nmap-scripts curl tcpdump bind-tools jq nmap-ncat libcap libcap-ng-utils && \
rm -rf /var/cache/apk/*

#Get kubectl modify the version for later ones, and damn but this is a big binary!
RUN curl -O https://storage.googleapis.com/kubernetes-release/release/v1.11.0/bin/linux/amd64/kubectl && \
chmod +x kubectl && mv kubectl /usr/local/bin

#Get docker we're not using the apk as it includes the server binaries that we don't need
RUN curl -O https://download.docker.com/linux/static/stable/x86_64/docker-18.06.0-ce.tgz && tar -xzvf docker-18.06.0-ce.tgz && \
cp docker/docker /usr/local/bin && chmod +x /usr/local/bin/docker && rm -rf docker/ && rm -f docker-18.06.0-ce.tgz

#Get etcdctl
RUN curl -OL https://github.com/coreos/etcd/releases/download/v3.3.9/etcd-v3.3.9-linux-amd64.tar.gz && \
tar -xzvf etcd-v3.3.9-linux-amd64.tar.gz && cp etcd-v3.3.9-linux-amd64/etcdctl /usr/local/bin && \
chmod +x /usr/local/bin/etcdctl && rm -rf etcd-v3.3.9-linux-amd64 && rm -f etcd-v3.3.9-linux-amd64.tar.gz

#Get oc
RUN curl -OL https://github.com/openshift/origin/releases/download/v3.10.0/openshift-origin-client-tools-v3.10.0-dd10d17-linux-64bit.tar.gz && \
tar -xzvf openshift-origin-client-tools-v3.10.0-dd10d17-linux-64bit.tar.gz && cp openshift-origin-client-tools-v3.10.0-dd10d17-linux-64bit/oc /usr/local/bin && \
chmod +x /usr/local/bin/oc && rm -rf openshift-origin-client-tools-v3.10.0-dd10d17-linux-64bit.tar.gz && rm -f openshift-origin-client-tools-v3.10.0-dd10d17-linux-64bit.tar.gz

#Copy the bolt browser binary in.
COPY boltbrowser /usr/local/bin

#Get AmIcontained
RUN curl -OL https://github.com/jessfraz/amicontained/releases/download/v0.4.3/amicontained-linux-amd64 && \
cp amicontained-linux-amd64 /usr/local/bin/amicontained && chmod +x /usr/local/bin/amicontained

#lets set some capabilities
#RUN setcap cap_net_raw+ep /usr/bin/nmap
#RUN setcap cap_net_raw+ep /usr/sbin/tcpdump 


#create our new user
RUN adduser -S tester

#set the workdir, why not
WORKDIR /home/tester



USER tester
