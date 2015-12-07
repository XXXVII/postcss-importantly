postcss = require 'postcss'

module.exports = postcss.plugin "postcss-importantly", ->
  (style, result) ->
    root = postcss.parse style

    root.walkRules (rule) ->
      return if rule.parent.type == 'atrule' #breakpoints inside keyframes
      rule.every (decl) ->
        return if  !decl.value || decl.important
        decl.value += '!important'
    result.root = root
