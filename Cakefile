require 'flour'
{exec} = require 'child_process'
config = require "#{__dirname}/config/#{process.env.NODE_ENV}.json"

fs     = require 'fs'

task 'build:coffee', 'Building Coffee',->
    
    coffee = exec 'coffee --bare -c --output public/js/ public/coffee/', (err, output) ->
      throw err if err
      console.log output
    console.log 'Built Coffee'

task 'build:less', 'Building Less', ->
    
    if process.env.NODE_ENV is "dev"
      less = exec 'node_modules/less/bin/lessc public/less/*.less > public/css/main.css', (err, output) ->
        throw err if err
        console.log output
    else
      less = exec 'node_modules/less/bin/lessc public/less/*.less > public/css/main.css --yui-compress', (err, output) ->
        throw err if err
        console.log output
    console.log 'Built Less'

task 'build', 'Build All', ->
    invoke 'build:coffee'
    invoke 'build:less'
  

task 'watch', 'watch Less and Coffee and then compile', ->
    invoke 'build:less'
    invoke 'build:coffee'

    watch 'public/less/*.less', -> invoke 'build:less'
    watch 'public/coffee/*.coffee', -> invoke 'build:coffee'

