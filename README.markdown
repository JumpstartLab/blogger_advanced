# Blogger Advanced -- Perf Workshop

This is a branch of the blogger project intended for a performance
optimization workshop at Turing. The project includes several tweaks to
produce some performance issues for students to troubleshoot, including:

* Larger seed file
* Switched DB to Postgres
* Pre-built DB dump to expedite seeding data
* Skylight.io installation to aid in diagnosing perf bottlenecks
* Caching libraries included

## Getting Started -- Checking Out the Branch and Loading Sample Data

Since generating a large amount of sample data via a DB seed task takes
time, this branch includes a pre-built dataset in the form of a postgres
DB dump. This is a data format similar to what you might use to backup a
production postgres system.

A `pg_dump` is basically a direct snapshot of all the data contained in
the DB at a given time. As such it's much quicker for your local
postgres server to load all this data than it would be for you to
re-generate all the data via the seed task yourself.

To get set up with the app, checkout the branch, and load the sample
data, run these commands:

```bash
git clone git://github.com/JumpstartLab/blogger_advanced.git
cd blogger_advanced
git checkout -t origin/blogger-perf-workshop
bundle
rake sample_data:load
```

You should see a bunch of output from postgres as it loads up each table
from the db dump. Once it finishes, you can verify your dataset by
firing up a rails console and checking counts for our models:

```
rails c
Loading development environment (Rails 4.1.10)
irb(main):001:0> Article.count
   (21.7ms)  SELECT COUNT(*) FROM "articles"
=> 70001
```

## Dependencies for blogger-perf-workshop branch

This branch is intended to be a playground for exploring some additional
caching and optimization features, and as such it requires a few
additional dependencies. Make sure you have:

* Postgres installed and running
* Redis installed and running

## Caching Utilities

__Redis__

This app comes pre-configured with Redis as its cache store.
Anywhere in the app you can use `Rails.cache` to read
or write data to/from memcached.

Using the cache, you can set a key/value pair in the cache
using `Rails.cache.write("key", "value")` and read it using
`Rails.cache.read("key")`

Additionally, you can use the cache helper `cache { "stuff" }` from
within your view templates.

Remember that a cache is best used for short-term data that can be
easily re-generated if it expires or gets evicted by the cache server.

## Performance Auditing

This branch of blogger comes pre-configured with the NewRelic RPM agent.
NewRelic includes a simplified version of the monitoring tools in the
development environment. With your server running, visit
[http://localhost:3000/newrelic](http://localhost:3000/newrelic) to see
a quick performance summary of your recent web requests.

It should look something like:

![NewRelic Agent Dev Mode](https://www.evernote.com/shard/s294/sh/ea3c3662-a7e3-4044-b647-b3b92cfbdd0b/8b9f18be24aedd7a67d670f8cb7619a0/res/6ccedb01-70ff-4e8a-a0e3-a38795b72b4d/skitch.png?resizeSmall&width=832)

## Contribute

If you find something that is outdated or doesn't work, feel free to submit a pull request. All contributions are greatly appreciated.
