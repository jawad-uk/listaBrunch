exports.config =
  # See http://brunch.io/#documentation for docs.
  paths:
    public: 'www'

  files:
    javascripts:
      defaultExtension: 'coffee'
      joinTo:
        'scripts/app.js': /^app/
        'scripts/vendor.js': /^vendor/
      order:
        # Files in `vendor` directories are compiled before other files
        # even if they aren't specified in order.before.
        before: [
          'vendor/scripts/console-helper.js',
          'vendor/scripts/jquery.js',
          'vendor/scripts/underscore.js',
          'vendor/scripts/backbone.js'
        ]
    stylesheets:
      joinTo:
        'styles/app.css'
      order:
        before: [
          # 'vendor/styles/normalize.css',
          'app/styles/main.css'
          'bower_components/topcoat/css/topcoat-mobile-light.css',
          'bower_components/topcoat/css/topcoat-mobile-dark.css'
        ]
    templates:
      joinTo: 'scripts/app.js'
