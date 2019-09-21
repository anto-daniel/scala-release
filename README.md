### STEPS TO CREATE SCALA APP RELEASE ###


```
./prepare
cd ..
git clone https://github.com/bosh-packages/java-release.git
cd scala-release
bosh vendor-package openjdk-8 ../java-release/
bosh -n create-release --force
bosh -n upload-release
bosh -d scala-app deploy manifests/scala-app.yml
```

