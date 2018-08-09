[This repo](https://github.com/adam-m-jcbs/web) contains the source for my 
[website](http://amjacobs.net), built with Jekyll using the `alembic-jekyll-theme` theme.
These notes provide some documentation of the site and site maintenance.

### Preparing to build the site
To build this site and generally learn about Jekyll, I made use of some 
[YouTube tutorials](https://www.youtube.com/playlist?list=PLLAZ4kZ9dFpOPV5C5Ay0pHaa0RJFhcmcB),
the very nice [Jekyll documentation](https://jekyllrb.com/docs/home/), 
[Arch Linux documentation](https://wiki.archlinux.org/index.php/jekyll) on
Jekyll/Ruby, and the `alembic-jekyll-theme` [github readme](https://github.com/daviddarnes/alembic). 
This [Jekyll cheatsheet](https://devhints.io/jekyll) is also useful.

Jekyll is written in and uses the infrastructure of Ruby.  To build a site with
Jekyll, you'll need this foundation on the system you're developing your site
with.  For my setup (Arch Linux), I did the following system installs as root:

```
$ pacman -Syu ruby rubygems discount
```
For your setup, you'll want your package manager to get similar packages for
Ruby, Gems, and you may want the `discount` markdown implementation (not required,
but the resources I used recommended it).  There's a gem with the `rdiscount`
markdown implementation.  I'm not sure if this uses the system implementation.
A system implementation may be unnecessary.

Next, I used Ruby to install the essential components:

```
$ gem update
$ gem install bundler rdoc rdiscount jekyll alembic-jekyll-theme
```

Finally, it's necessary to configure your environment for developing sites with
Jekyll.  For this, I added the following to my `.bashrc`:

```
export PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
export GEM_HOME=$(ruby -e 'print Gem.user_dir')
```
This exposes executables like `jekyll` and facilitates installing gems as a
user (not root).

At this point, you should have the tools needed to build a new Jekyll site.

### Building the site
With our system ready, we can now build a site with Jekyll.

Make a directory to store your website's source files.  Jekyll will create a new
directory here and fill it with initial files to serve as a template for your
site.  This is the directory where we'll build the site, not host it.  We'll get
to hosting later. This looks like

```
$ mkdir Web
$ cd Web
$ jekyll new mysite
```

The new site may require gems you don't have.  To install all required gems, do

```
$ cd mysite
$ bundle install
```
This will install all the gems listed as dependencies in your site's `Gemfile`.

You now have a skeleton for your website.  Development is very easy, because you
can build and serve your website locally before dealing with anything on the
server hosting your site.  To serve the site locally, do the following in the site's
root directory (in the case above, this is `.../Web/mysite/`):

```
$ bundle exec jekyll serve
```
By default, this will make the site available in your browser
at `http://127.0.0.1:4000`.  I'm not sure when `bundle exec` is and is not
required, but the resources I consulted imply it's generally best practice to do
`bundle exec jekyll serve` instead of just `jekyll serve`.  As I understand it,
this ensures the site is served in the context of the local gems for the
project, which in some setups conflict with global gems.

### Adding a theme
To establish the overall look-and-feel and basic elements of the UI design we
can install a theme.  By default, your jekyll site will use (and install) the
`minima` theme, which looks great and should serve very well for many websites.
Your site and theme can still be highly customized.

If you don't want to use the default theme, a good way to find other themes is
to search the [Ruby gems database](https://rubygems.org) for `jekyll-theme`.
Not all themes include this in their name, but many do.  Most have a GitHub repo
that includes a demo site to give you an idea of how the theme looks.  I choose
the [`alembic-jekyll-theme`](https://github.com/daviddarnes/alembic) because
it's designed specifically as a boilerplate starting point for a site, it looks
great, and it appears to have a large number of users as well as active
development/maintenance.  The repo gives detailed installation instructions.

I actually installed this earlier, but it's good to build as a dependency.  To
do this, add

```
gem "alembic-jekyll-theme"
```
to your site's `Gemfile`.  You can then do `bundle install` to install.  To use
the theme, put

```
theme: alembic-jekyll-theme
```
in your site's `_config.yml` (more on this file later).

Often, the first thing that will happen after this is that your site is suddenly
a blank page.  This is because the theme probably doesn't provide the layout
being used by your `index.md`.  In my case, it was using `home`, which `alembic`
doesn't provide.  Once I changed it to `page`, the site was no longer blank.
Layouts serve as templates.  You can make and use your own in a
`_layouts` directory.  What's a bit confusing is that themes store their layouts
in the gemfile, so you won't see them.  To see the available layouts, you can do

```
$ bundle show alembic-jekyll-theme
```
This will give you the directory for the theme's gemfile.  Inside it, you should
see a `_layouts` directory.  Mine looks like

```
$ ls /home/ajacobs/.gem/ruby/2.5.0/gems/alembic-jekyll-theme-3.0.2/_layouts/
blog.html  categories.html  default.html  page.html  post.html
```

Though the theme seems to work without it, I also incorporated elements of the
example `_config.yml` provided in `alembic`'s
[README](https://github.com/daviddarnes/alembic).  I suggest reading that
documentation to learn more about ways to customize and some of the more
powerful features available in the theme.

### Customization and configuration
I love how customizable Jekyll is and the power it gives you over your site.
This includes customizing the themes, so a theme doesn't lock you into too much
(if you look at example sites built with alembic, you'll see some of the
possibilities).

The first thing you need to understand about configuring and customizing a
Jekyll site is the `_config.yml` file.  The Jekyll docs give a nice
[overview](https://jekyllrb.com/docs/configuration/) of
this file along with a list of some of the key variables. `alembic-jekyll-theme`
also provides an example `_config.yml`.  I used these two resources to write my
site's `_config.yml`.  Below, I'll just mention and document some of the key
changes I made.

**Key `Gemfile` lines**

```
gem "rdiscount"
gem "alembic-jekyll-theme"
```

**Key `_config.yml` lines***

```
markdown: rdiscount
theme: alembic-jekyll-theme
timezone: America/New_York
# Site navigation
navigation_header:
    Home: /
    CV: /cv/
    Research: /research/
    Notes: /notes/
```

You can customize aspects of your theme by copying files into your site
directory that supercede the defaults. An example of doing this that I've done
was to modify the sidebar alembic offers when you put `aside: True` in your YAML
front matter.  To do this, I first found the file with

```
$ bundle show alembic-jekyll-theme
```
I then copied `site-aside.html` from the gem `_includes` directory into my
site's `_includes` directory.  I then modified the html to make the sidebar I
want. 

### Deploying the site
The primary reason I switched to Jekyll for site development is because
I can use the same workflow I use for code development.  I write plain-text
files, compile those into a static website with Jekyll, and then just copy (via
scp, git, rsync, or any other method commonly used in code development as well)
the `_site` files to my website's server.  Updating my site is as simple as
editing a text file, compiling, and git magic, just like when I code.

Perhaps the easiest and cheapest way to deploy/host your site is to use GitHub pages.  The
resources I linked at the beginning of these notes offer lots of details on how
to do this.  The only reason I didn't is because I already had my website setup
through a hosting service.  It also seems that
[Netlify](https://www.netlify.com/blog/2015/10/28/a-step-by-step-guide-jekyll-3.0-on-netlify/)
is a popular service for deploying Jekyll sites in an automated way with nice
git integration.

If you're like me and just have a remote server that hosts your site, you can do
something like the `deploy.sh` script in my site repo's
[`util/`](https://github.com/adam-m-jcbs/web/tree/master/util) directory:

```
#!/bin/bash
#deploy.sh

host_domain=amjacobs.net
sync_command="cd web && date | tee -a gitsync.out gitsync.err > /dev/null && git pull 1>>gitsync.out 2>>gitsync.err"

bundle exec jekyll build
git commit -am'Rebuild site.'
git push

ssh $host_domain "$sync_command"
```

Now when I need to update my site, I simply make the desired changes, commit
them, and then execute `bundle exec deploy.sh` in the site's root directory.
Note that for this to work you will need to [setup ssh
keys](https://gist.github.com/stormpython/9517102) for passwordless ssh access.
