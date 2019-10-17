# Macaroni

[Guide used](https://akoutmos.com/post/multipart-docker-and-elixir-1.9-releases/)

## Docker build and run

**Build**
`docker build -t macaroni-app .`

**Run**
`docker run --publish 4000:4000 --env COOL_TEXT='ELIXIR ROCKS!!!!' --env SECRET_KEY_BASE=$(mix phx.gen.secret) --env APP_PORT=4000 --env DATABASE_URL=postgresql://postgres:@docker.for.mac.host.internal/macaroni_dev macaroni-app:latest`

`docker.for.mac.host.internal` instead of `localhost` to access mac localhost

**Run a shell in the running container**
```
docker exec -it <container_id> bash
./prod/rel/macaroni/bin/macaroni remote

> :observer_cli.start()
```

## Push to ECR

```sh
$(aws ecr get-login --no-include-email)
docker push 782603956529.dkr.ecr.ap-southeast-1.amazonaws.com/macaroni:latest
```
