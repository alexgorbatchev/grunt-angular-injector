module.exports = (grunt) ->
  angularInjector = require 'angular-injector'

  grunt.registerMultiTask 'angular-injector', 'Annotates angular.js files with dependency injection arrays', ->
    @files.forEach (files) =>
      files.src.forEach (filepath) =>
        return grunt.log.warn "Source file \"#{filepath}\" not found." unless grunt.file.exists filepath
        grunt.file.write files.dest, angularInjector.annotate grunt.file.read(filepath), @options()
