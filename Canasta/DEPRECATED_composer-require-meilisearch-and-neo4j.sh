#!/bin/bash

sudo docker exec mwstakeorgdevclone_web_1 bash -c 'composer require --with-all-dependencies meilisearch/meilisearch-php:0.25.0 symfony/http-client nyholm/psr7 laudis/neo4j-php-client'
