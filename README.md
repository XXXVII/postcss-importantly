# postcss-importantly

PostCSS plugin to add !important for every declaration.

## Why do I need this?
The best way to isolate your CSS is to give maximum weight for your declarations. Adding !important is the easiest way for it.


## Installation

Run npm install **postcss-importantly --save-dev**

In your **Gulpfile** use this command to process stylesheet:

```
gulp.src('app/*.css')
  .pipe $.postcss [require('postcss-importantly')]
  .pipe gulp.dest('.dist')
```

**Note** that plugin ignores @-rules (such as @font-face and @keywords) due to lack in browser support.
