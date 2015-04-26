# Blogger Advanced -- Perf Workshop

This is a branch of the blogger project intended for a performance
optimization workshop at Turing. The project includes several tweaks to
produce some performance issues for students to troubleshoot, including:

* Larger seed file
* Switched DB to Postgres
* Pre-built DB dump to expedite seeding data
* Skylight.io installation to aid in diagnosing perf bottlenecks

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
