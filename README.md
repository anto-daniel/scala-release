### STEPS TO CREATE SCALA APP RELEASE ###


```
./prepare
bosh -n create-release --force
bosh -n upload-release
bosh -d scala-app deploy manifests/scala-app.yml
```

