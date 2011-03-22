#!/usr/bin/env nake

# TODO: rewrite the example to Rango, it would be more interesting
# Or maybe add more examples for jekyll, nanoc, Django, maybe Rails.
$:.unshift(File.join(File.dirname(__FILE__), "..", "tasks"))

load "git-deployer.nake"

#Task["deployer:setup"].config[:user] = "TODO"
#Task["deployer:setup"].config[:host] = "TODO"
#Task["deployer:setup"].config[:path] = "/var/www/deploy-test"

begin
  load "git-deployer.nake"
  Task["deployer:setup"].config[:servers] = {
    server1: {
      user: "git",
      host: "10.4.87.218",
      repo: "/srv/git/deploy-test.git",
      path: "/srv/www/codeigniter/application/deploy-test"
    }
  }
rescue LoadError
  warn "You have to install git-deployer gem if you want to deploy to remote servers!"
end