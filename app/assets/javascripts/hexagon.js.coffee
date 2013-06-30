$ = jQuery

# Adds plugin object to jQuery
$.fn.extend
  # Change pluginName to your plugin's name.
  hexanize: (options) ->
    # Default settings
    settings =
      width: '150px'
      background: 'green'

    # Merge default settings with options.
    settings = $.extend settings, options

    # _Insert magic here._
    return @each ()->
      settings.height = settings.width / Math.sqrt(3)
      $(this).addClass('hexanize')
        .append(
          $('<div/>').addClass('hexanize-inner1')
        ).append(
          $('<div/>').addClass('hexanize-inner2')
        )
      # .css
         # width: settings.width
         # height: settings.height

