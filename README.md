Solidus Comments
==============

[![Build Status](https://travis-ci.org/solidusio-contrib/solidus_comments.svg?branch=master)](https://travis-ci.org/solidusio-contrib/solidus_comments)

Solidus Comments is an extension for Solidus to allow commenting on different models via the
admin ui and currently supports Orders & Shipments.

Solidus Comments also supports optional comment Types which can be defined per comment-able
object (i.e. Order, Shipment, etc) via the admin Configuration tab.

This is based on a fork / rename of jderrett/spree-order-comments, and subsequently spree/spree-comments

Notes:

* Comments are create-only.  You cannot edit or remove them from the Admin UI.

Installation
------------

Add the following to your Gemfile (or check Versionfile for Solidus versions requirements):

    gem "solidus_comments"

Run:

```shell
bundle install
bundle exec rails g solidus_comments:install
```

Run the migrations if you did not during the installation generator:

    bundle exec rake db:migrate

Start your server:

    rails s
