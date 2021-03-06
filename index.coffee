postcss = require 'postcss'

module.exports = postcss.plugin "postcss-importantly", ->
  (style, result) ->
    root = postcss.parse style

    root.walkRules (rule) ->
      return if rule.parent.type == 'atrule' and rule.parent.name != 'media' #breakpoints inside keyframes
      rule.each (decl) ->
        return if  !decl.value || decl.important
        decl.value += '!important'
    result.root = root
