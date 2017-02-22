# dockerfile-blog

Dockerfile for [blog](https://github.com/zyfdegh/blog)

# Features

Auto deploying blogs with docker and hugo.

Auto updating blogs every 5min.

# Param

Specific environment variables when run docker container:

**BLOG_BASE_URL**: Base url for hugo to generate static file path. 

example1: http://45.32.27.127/

example2: https://zyfdegh.github.io/

example3: http://myblog.com/

# Run

If I have a domain `blog.fanach.win` -> `1.2.3.4`.

```sh
sudo docker run -d --restart=always -p 80:80 -e BLOG_BASE_URL="http://blog.fanach.win/" zyfdedh/blog
```
