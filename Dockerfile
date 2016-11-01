FROM php:7.0-alpine

# To build under proxy, use: docker build --build-arg "http_proxy=$http_proxy" 
RUN if test -n "$http_proxy"; then pear config-set http_proxy "$http_proxy"; fi

RUN pear install PHP_CodeSniffer-2.7.0

# Install the WordPress rules
ADD https://github.com/WordPress-Coding-Standards/WordPress-Coding-Standards/archive/master.zip /master.zip
RUN unzip /master.zip -d / && \
    phpcs --config-set installed_paths /WordPress-Coding-Standards-master