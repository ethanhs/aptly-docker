# Aptly docker container

This is an aptly docker container.

Example usage:

```
$ docker run --rm -v $(pwd)/example.conf:/etc/aptly.conf -v $(pwd)/apt:/opt/apt aptly repo list
```