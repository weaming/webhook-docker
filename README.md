## Usage

```
git clone https://github.com/weaming/webhook-docker && cd webhook-docker
docker build -t webhook .
docker run -it --rm --name webhook \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v $PWD/webhook:/etc/webhook \
    -p 9000:9000 webhook

# in another terminal
curl localhost:8000/hooks/ls
curl localhost:8000/hooks/test.sh
```

## Available shebang:
* `/bin/sh`
* `/bin/bash`
* `/usr/bin/fish`
