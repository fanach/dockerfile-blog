#!/bin/sh
nohup cron > /var/log/cron.log 2>&1 &
hugo server --baseURL=${BLOG_BASE_URL} --bind=0.0.0.0 -ws ~/repo
