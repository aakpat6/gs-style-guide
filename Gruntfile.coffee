module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    less:
      all:
        options:
          # yuicompress: true
          dumpLineNumbers: 'comments'
        files:
          'css/style.css': 'less/style.less'

    markdown:
      all:
        options:
          template: 'jst/main.jst'
          markdownOptions:
            highlight: 'manual'
            gfm: true
        files: [
          cwd: 'md'
          expand: true
          src: '*.md'
          dest: ''
          ext: '.html'
        ]

    watch:
      less:
        files: ['less/*.less', 'less/bootstrap/*.less']
        tasks: ['less']
      markdown:
        files: ['md/*.md', 'jst/*.jst']
        tasks: ['markdown']

  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-markdown'
  grunt.loadNpmTasks 'grunt-dust-html'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', ['less', 'markdown', 'watch']
