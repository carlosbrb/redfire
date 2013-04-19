RedFire
=============================

A Redmine plugin for awesome campfire notifications

Installation
------------

- Works on redmine 2.3+
- You need Tinder gem. Add it to your Gemfile

`gem 'tinder'`

and then run:

`bundle install`

- Install the plugin:

`git clone git@github.com:carlosbrb/redfire.git #{redmine_root/plugins}`

- run `rake redmine:plugins:migrate` (don't forget set yout environment)

- Restart redmine anf you will see "Notifications" in your project -> Configuration -> modules, check it and save

- You'll see a new tab in your project, puts campfire data requested, save and voilá!

Notifies when an issue is created and edited (by now)


ToDo
---------

- Add hooks for Wiki
- Add tests
- Add a notification test 
