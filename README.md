#  Docker container with Gatsby v2 for your doc portal


## PREREQUISITES

* docker installed [see instruction](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/)
* docker-compose installed [see instruction](https://docs.docker.com/compose/install/)


## BUILD

```
$ docker-compose build --no-cache
```

## SETUP

provide your private key
```
$ cp ~/.ssh/id_rsa ./gatsby/.ssh/id_rsa
```

provide your `.gitconfig`
```
$ cp ~/.gitconfig ./gatsby/.gitconfig
```

## RUN
```
$ docker-compose up
```

## USE

### Preview
To preview the doc website, open in browser http://localhost:8999/

### Update
To edit/create the docs and improve the website, update the files in ./shared folder.

### Save
To save the updates, run:

```
docker exec -ti <containerID> bash
cd /root/gatsby_projects/${REPO_FOLDER}
git add *
git commit -m "<Your commit message. Describe the changes to the content and the website>"
git push
```

### Publish
To publish the website on github.io, run:

```
docker exec -ti <containerID> bash
cd /root/gatsby_projects/${REPO_FOLDER}/${DOC_FOLDER}

npm run build:gh
```

## STOP
```
^C
...
$ docker-compose down
```
