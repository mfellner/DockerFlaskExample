### Docker Flask Example

This is a simple example project that shows how to run a simple [Flask](http://flask.pocoo.org) application inside a Docker container.

##### Docker & Boot2Docker (OS X)

```bash
make run
```

Builds and runs the project directly as a Docker container. This should potentially also work on Linux as long as Docker is installed and running.

If you're on **OS X** and a Docker instance is not already running somehow, this will install and use [boot2docker-cli](https://github.com/boot2docker/boot2docker-cli) in the current directory (requires Go).

```bash
make clean
```

Stops and removes the container and any remaining garbage.

##### Vagrant & Docker

```bash
make vagrant
```

Runs the project via the Vagrant docker provider. In order to use port forwarding, a custom box (declared in `vagrant/`) is being used.

Please note that the other Makefile targets `setup`, `clean`, `build` and `run` are reserved for using Docker *directly*. Refer to the [Vagrant docs](https://docs.vagrantup.com/v2/docker/index.html) for information on how to interact with Docker.

##### Test the connection

```bash
make test
```

This just `curl`s the *Boot2Docker* VM or the *Vagrant* VM. When using Boot2Docker a script is used to find out the ip address of the VM. With Vagrant the target is simply *localhost*.
