
###### Using Boot2Docker on OS X

Build [boot2docker-cli](https://github.com/boot2docker/boot2docker-cli):

You can now access the application which is running inside the docker container:

```bash
curl `./boot2docker ssh ip addr show eth1 | grep -o -E '\d+\.\d+\.\d+\.\d+' | head -1`
```
