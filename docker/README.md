## Deployment

To deploy and start the container by doing the following:

```sh
$ docker build -t tamarin-ssh .
$ ./run
```

If the non-root access to the docker daemon has not been granted, you have
to tweak the commands a bit:

```sh
$ sudo docker build -t tamarin-ssh .
$ sudo ./run
```
Further, we assume a root access to the daemon and omit *sudo* command.

If you want to pass additional parameters to Docker, when starting a container,
you can pass them directly to the *./run* script. Here, for example, we
mount a host's directory as a read-only data volume:

```sh
$ ./run -v $(realpath ../some/dir):/container/data/volume:ro
```

## Connecting to the server

In order to connect to the container via SSH use:

```sh
$ ./connect.sh
```

When the system asks, whether the connection should be established with an 
unauthenticated host, type *'yes'*. The password of the root is *'root'*.

## Using tamarin-prover

Tamarin executable is already in the *$PATH*, so you can use the tool without
any further fuss. When you start the interactive mode, the results are tunneled 
from the container to the host; they are accessible at **localhost:3001**.

## Stopping tamarin-prover

To close the connection, type *exit* or use Ctrl-D. To stop and remove the
container use:

```sh
$ ./stop.sh
```
