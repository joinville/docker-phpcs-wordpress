Docker image for [PHP_CodeSniffer](https://github.com/squizlabs/PHP_CodeSniffer) already configured for [WordPress Coding Standards](https://github.com/WordPress-Coding-Standards/WordPress-Coding-Standards).

## Build

```bash
# No proxy
docker build --no-cache -t joinville/phpcs-wordpress .

# Under proxy
docker build --no-cache -t joinville/phpcs-wordpress --build-arg "http_proxy=$http_proxy" .
```

## Test

Show the available standards:

```console
$ docker run joinville/phpcs-wordpress phpcs -i
The installed coding standards are MySource, PEAR, PHPCS, Squiz, Zend, PSR2, PSR1, WordPress, WordPress-Extra, WordPress-Docs, WordPress-Core and WordPress-VIP
$
```

## Run

```bash
# Check for code standards issues
docker run -v /path/to/php/files/:/scripts/ joinville/phpcs-wordpress phpcs  --standard=WordPress-Core /scripts/

# Fix code standards issues
docker run -v /path/to/php/files/:/scripts/ joinville/phpcs-wordpress phpcbf --standard=WordPress-Core /scripts/
```

## GitLab CI example

```yaml
# Run PHP_CodeSniffer in our custom WordPress plugin and theme
code_lint:
  stage: test
  image: joinville/phpcs-wordpress
  script:
    - phpcs --standard=WordPress-Core wp-content/plugins/my-awesome-plugin
    - phpcs --standard=WordPress-Core --ignore=/bootstrap/,/inc/ wp-content/themes/my-awesome-theme
```
