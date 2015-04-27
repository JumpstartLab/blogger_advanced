# Blogger Advanced -- Perf Workshop

This is a branch of the blogger project intended for a performance
optimization workshop at Turing. The project includes several tweaks to
produce some performance issues for students to troubleshoot, including:

* Larger seed file
* Switched DB to Postgres
* Pre-built DB dump to expedite seeding data
* Skylight.io installation to aid in diagnosing perf bottlenecks
* Caching libraries included

## Dependencies for blogger-perf-workshop branch

This branch is intended to be a playground for exploring some additional
caching and optimization features, and as such it requires a few
additional dependencies. Make sure you have:

* Postgres installed and running
* Redis installed and running
* Memcached installed and running

### Caching Utilities

__Memcached__

This app comes pre-configured with Dalli (a ruby memcached client) as
its cache store. Anywhere in the app you can use `Rails.cache` to read
or write data to/from memcached.

Remember that memcached is best used for short-term data that can be
easily re-generated if it expires or gets evicted by the cache server.
One of the main differences between redis and memcached is that a
memcached server will evict keys as necessary if it starts to run out of
space, so consider this when deciding what data to write to the cache.

__Redis__

This branch also includes a pre-configured redis connection intended for
use caching data. This is set up in `config/initializers/redis.rb`. The
connection is configured to use a namespace for all of our data and is
assigned to a constant which can be accessed from anywhere in the app.
e.g:

```
REDIS.set("my-key", "my-value")
REDIS.get("my-key")
=> "my-value"
```

Redis and memcached serve similar niches in a rails production stack,
but most developers tend to use redis for caching smaller, specific
pieces of data. Unlike memcached, redis won't evict your keys when it
fills up, although it does set include a time-based expiration for all
keys by default.

Things that make a good fit for redis include

* Ids or slugs of specific data entities ("most popular article", "most
  frequently read author", etc)
* Small JSON payloads describing important or expensive-to-generate data
* Sets or collections of data ("ids of all articles for a tag", etc --
  read up on some of redis' set-manipulation features if you find
  yourself doing this frequently)

## Getting Started

```bash
git clone git://github.com/JumpstartLab/blogger_advanced.git
cd blogger_advanced
bundle
rake db:migrate
rails server
```

## Contribute

If you find something that is outdated or doesn't work, feel free to submit a pull request. All contributions are greatly appreciated.
