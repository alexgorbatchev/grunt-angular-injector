require 'coffee-errors'

chai = require 'chai'
grunt = require 'grunt'
fs = require 'fs'
# using compiled JavaScript file here to be sure module works
gruntAngularInjector = require '../tasks/grunt-angular-injector.js'

expect = chai.expect

describe 'grunt-angular-injector', ->
  expected = actual1 = actual2 = null

  before ->
    expected = fs.readFileSync "#{__dirname}/expected.js", 'utf8'

  it 'creates files', ->
    actual1 = fs.readFileSync "#{__dirname}/actual/test/fixtures/file1.js", 'utf8'
    actual2 = fs.readFileSync "#{__dirname}/actual/test/fixtures/file2.js", 'utf8'

  it 'annotates files', ->
    expect(actual1).to.eql expected
    expect(actual2).to.eql expected
