Install latest version of Docker:

* [Download Community Edition](https://www.docker.com/community-edition#/download)
* [Manual installation of debian package for Ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-from-a-package)


Start by building the docker image:

    sudo docker build -t $tag_name .

Once the image is built, containers can be launched from it. The image only needs to be rebuilt if the Dockerfile has changed.

Launch a container:

    sudo docker run \
        -p 88:88 \
        --mount type=bind,source="$(pwd)",target=/notebooks \
        --rm \
        $tag_name

The `-p` flag forwards the container's port to the host. `--mount` will share the work directory with the container. `--rm` will remove the container when jupyter is stopped. If running the container as a background process is desired, then use `-d`. In this case the token will not be returned to the command line but can be retrieved by this command `sudo docker exec $container_name jupyter notebook list`.


Things to do:
* One docker file for python3, one for python2
* Fix token
* Build without proxy?
