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
```

1. Next, sign up for [Skylight](https://www.skylight.io/signup) using GitHub.
1. Add a new app to your Skylight dashboard. This is in the upper left corner of your dashboard as of this writing.
1. On the next screen you should see a line that looks like this: `bundle exec skylight setup <setup token>`. Copy the line with the real setup token and run in your terminal from within this project diretory. This sets up your app to talk to Skylight.
1. Make sure you don't commit your API token. Use ENV variables if you plan on pushing code changes to GitHub. This project has `figaro` installed already if that's your preference.

Load our large dataset by running this rake task in your terminal:

```
rake sample_data:load
```

You should see a bunch of output from postgres as it loads up each table
from the db dump. Once it finishes, you can verify your dataset by
firing up a rails console and checking counts for our models:

```
rails c
irb(main):001:0> Article.count
   (21.7ms)  SELECT COUNT(*) FROM "articles"
=> 70001
```

Next, confirm Skylight is picking up your page loads. The root page will take forever to load so navigate to [/http://localhost:3000/articles/3](http://localhost:3000/articles/3) and reload five times.

Take a look at the `development` analytics page for your new app. You can switch the enviroment you are looking at by selecting the drop down in the upper left corner, to the right of the app name, on the Skylight dashboard.

It might take a few minutes for the data to show up so be patient. If you don't see it in 5 minutes something probably went wrong.

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

This branch of blogger comes pre-configured with the Skylight.io gem installed.

By default, Skylight records results against production applications. This app has been configured to measure performance while running in development. This is not typical behavior but we're using this as a way to learn to use the tools.

In `config/application.rb` the line `config.skylight.environments += ["development"]` lets Skylight know to record in dev mode.

## Contribute

If you find something that is outdated or doesn't work, feel free to submit a pull request. All contributions are greatly appreciated.
