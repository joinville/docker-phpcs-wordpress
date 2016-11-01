
Docker image for [PHP_CodeSniffer](https://github.com/squizlabs/PHP_CodeSniffer) already configured for [WordPress Coding Standards](https://github.com/WordPress-Coding-Standards/WordPress-Coding-Standards).

## Build

```bash
# No proxy
docker build --no-cache -t phpcs-wordpress .

# Under proxy
docker build --no-cache -t phpcs-wordpress --build-arg "http_proxy=$http_proxy" .
```

