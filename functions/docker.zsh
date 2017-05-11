#!/bin/sh

docker-yml() {
  docker inspect -f $'
{{.Name}}
  image: {{.Config.Image}}
  entrypoint: {{json .Config.Entrypoint}}
  environment: {{range .Config.Env}}
    - {{.}}{{end}}
' $1
}
