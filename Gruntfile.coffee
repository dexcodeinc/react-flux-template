module.exports = (grunt) ->
  grunt.loadNpmTasks('grunt-browserify')
  grunt.loadNpmTasks('grunt-contrib-less')
  grunt.loadNpmTasks('grunt-contrib-watch')

  browserifyConfig =
    options:
      browserifyOptions:
        standalone: 'Application'
        extensions: ['.coffee', '.cjsx']
        debug: true
      transform: [
        ['coffee-reactify', { "coffeeout": true }]
        'coffeeify'
        'envify'
      ]
    development:
      files:
        "public/main.js": "app/main.coffee"

  lessConfig =
    options:
      paths: ['static/']
    development:
      files:
        "public/main.css": "static/main.less"
    production:
      files:
        "public/main.css": "static/main.less"

  watchConfig =
    css:
      files: ['static/**/*.less']
      tasks: ['less:development']
    js:
      files: ['app/**/*.coffee', 'app/**/*.cjsx', 'app/**/*.js']
      tasks: ['browserify:development']

  grunt.initConfig
    browserify: browserifyConfig
    less: lessConfig
    watch: watchConfig

  grunt.registerTask('compile', ['browserify:development', 'less:development'])
