module.exports = ->
  # Project configuration
  @initConfig
    pkg: @file.readJSON 'package.json'

    # CoffeeScript compilation
    coffee:
      src:
        expand: true
        cwd: 'src'
        src: ['**.coffee']
        dest: 'src'
        ext: '.js'

    # Automated recompilation and testing when developing
    watch:
      files: ['test/*.coffee', 'src/*.coffee']
      tasks: ['test']

    # BDD tests on Node.js
    cafemocha:
      nodejs:
        src: ['test/*.coffee']
        options:
          reporter: 'spec'

  # Grunt plugins used for testing
  @loadNpmTasks 'grunt-contrib-coffee'
  @loadNpmTasks 'grunt-contrib-watch'
  @loadNpmTasks 'grunt-cafe-mocha'

  # Our local tasks
  @registerTask 'build', ['coffee']
  @registerTask 'test', ['cafemocha']
  @registerTask 'default', ['test']