# Karma Ville 1 Too Slow 
 
##Learning Competencies 
- Performance debugging: find the offender
- Performance strategy: find the lowest hanging fruit
- Performance tuning: make it faster

##Summary 

 Welcome to KarmaVille!  Things would be great if things weren't so slow.

We have a pre-built Rails application with two models: `User` and `KarmaPoint`.  After seeding the database with data, you'll have 100,000 rows in the `users` table and 1,500,000 rows in the `karma_points` table.  The index page is sl-o-o-ow and it's your job to speed it up without using any fancy technologies like [memcache](http://memcached.org/), [redis](http://redis.io/), or Rails' [fragment caching](http://guides.rubyonrails.org/caching_with_rails.html).

### Setting Up the Application

Get the application running as follows:

```text
$ cd source
$ bundle install
$ rake db:setup
```

The `rake db:setup` command could take a few minutes.  Once it's done run `rails server` and visit [http://localhost:3000](http://localhost:3000).

We use a gem called activerecord-import to mass import data into the database. Here is an issue to be aware of:  [this issue](https://github.com/zdennis/activerecord-import/wiki/Callbacks)
It should take a few seconds to load.  If you look at the last line of your server logs, you'll see it telling you how much time was spent rendering the views versus how much time was executing `ActiveRecord` methods.  Where's the bottleneck?

### Make it fast!

Your goal is to get the index page to load in under **200ms**.  Yes, that's milliseconds.  You're permitted to do the following:

1. Add new fields to the `users` and `karma_points` tables
2. Add new indexes to the `users` and `karma_points` tables
3. Add new class or instance methods to the `User` or `KarmaPoint` models

The test suite should remain green.  If you add any new public methods make sure you add appropriate corresponding tests.

You **should not** change the controller or view code. 

##Releases
###Release 0 
Identify why the app is so slow. Find the offending code(s) responsible for the
performance hit.
###Release 1
Come up with a strategies to fix the offending code(s) that you've identified.
###Release 2
Execute your strategies one at a time and make sure you're on the right track.
Make the app faster.
