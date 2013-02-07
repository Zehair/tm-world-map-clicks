express = require 'express'
path = require 'path'
fs = require 'fs'
config = require "#{__dirname}/config/#{process.env.NODE_ENV}.json"


app = express()

# redirect stderr to configured log file
if config.application.error_log_file?
  console.log "Errors will be logged in #{config.application.error_log_file}"
  stderr = fs.createWriteStream(config.application.error_log_file, { flags: 'a' })
  process.__defineGetter__("stderr", () -> return stderr)

app.configure ->
  app.set 'port', config.application.port
  app.set 'host', config.application.host
  app.set 'view options',
    layout: true
  app.use express.logger('dev')
  app.use express.bodyParser()
  app.use express.methodOverride()
  # app.use express.cookieParser("secret")
  # app.use app.router
  app.use express.static(path.join(__dirname, '/public'))
 

exports.app = app
