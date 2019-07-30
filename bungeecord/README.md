# bungeecord dockerfile

This dockerfile has two arguments. The first is the `uid` to run as, the second is the `url` to fetch during the build.

This allows you to build a Waterfall-based image easily as such:

```sh
docker build . --build-arg url="https://papermc.io/ci/job/Waterfall/lastSuccessfulBuild/artifact/Waterfall-Proxy/bootstrap/target/Waterfall.jar" -t waterfall
```
