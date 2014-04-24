module.exports = (grunt) ->
  grunt.initConfig
    'angular-injector':
      test:
        options:
          token: 'ng'

        expand: true
        src: ['test/fixtures/*.js']
        dest: 'test/actual/'

  grunt.loadTasks 'tasks'
