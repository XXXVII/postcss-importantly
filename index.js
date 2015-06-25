var postcss;

postcss = require('postcss');

module.exports = postcss.plugin("postcss-importantly", function() {
  return function(style, result) {
    var root;
    root = postcss.parse(style);
    root.eachRule(function(rule) {
      if (rule.parent.type === 'atrule') {
        return;
      }
      return rule.eachDecl(function(decl) {
        if (!decl.value || decl.important) {
          return;
        }
        return decl.value += '!important';
      });
    });
    return result.root = root;
  };
});
