# building

```
docker run --rm -it \
  -v $SSH_AUTH_SOCK:/ssh-agent \
  -v .:/home/node/app \
  -e GIT_COMMITTER_NAME="$GIT_COMMITTER_NAME" \
  -e GIT_COMMITTER_EMAIL="$GIT_COMMITTER_EMAIL" \
  -e GIT_AUTHOR_NAME="$GIT_COMMITTER_NAME" \
  -e GIT_AUTHOR_EMAIL="$GIT_COMMITTER_EMAIL" \
  -e SSH_AUTH_SOCK=/ssh-agent \
  tibomogul/obsidian-slides-extended \
  bash -l
```

```
DOCKER_BUILDKIT=1 docker build --ssh default -t tibomogul/obsidian-slides-extended .
```

```
BUILDKIT_PROGRESS=plain DOCKER_BUILDKIT=1 docker build --ssh default -t tibomogul/obsidian-slides-extended .
```