# grunt-angular-injector

[![Dependency status](https://david-dm.org/alexgorbatchev/grunt-angular-injector.png)](https://david-dm.org/alexgorbatchev/grunt-angular-injector)
[![devDependency Status](https://david-dm.org/alexgorbatchev/grunt-angular-injector/dev-status.png)](https://david-dm.org/alexgorbatchev/grunt-angular-injector#info=devDependencies)
[![Build Status](https://secure.travis-ci.org/alexgorbatchev/grunt-angular-injector.png?branch=master)](https://travis-ci.org/alexgorbatchev/grunt-angular-injector)

[![NPM](https://nodei.co/npm/grunt-angular-injector.png?downloads=true)](https://npmjs.org/package/grunt-angular-injector)

This grunt.js plugin is meant to solve an annoying problem of minification and dependency injection in [`angular.js`](https://www.angularjs.org). `angular-injector` works better and more reliably than [`ngmin`](https://www.npmjs.org/package/ngmin) because it works with any syntax and every possible declaration regardless of where and how it happens. `grunt-angular-injector` wraps [`angular-injector`](https://github.com/alexgorbatchev/angular-injector).

In order for minified Angular applicaiton to continue working, all functions must be annotated:

    someModule.factory('greeter', function($window) {
      // ...
    });

Must be rewritten as:

    someModule.factory('greeter', ['$window', function($window) {
      // ...
    }]);

This module does that automatically.

## Support

Please help me spend more time developing and maintaining awesome modules like this by donating! Just setup [Gittip](http://gittip.com) if you haven't already and if you donate $1/week I can buy a coffee on your behalf to keep me coding.

[![Gittip](http://img.shields.io/gittip/alexgorbatchev.png)](https://www.gittip.com/alexgorbatchev/)
[![PayPayl donate button](http://img.shields.io/paypal/donate.png?color=yellow)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=PSDPM9268P8RW "Donate once-off to this project using Paypal")

## Installation

    npm install grunt-angular-injector

Once the plugin has been installed, it may be enabled inside your Gruntfile with this line of JavaScript:

    grunt.loadNpmTasks('grunt-angular-injector');

## Usage Example

Write your angular functions like so:

    someModule.factory('greeter', ng(function($window) {
      // ...
    }));

Then run them through `angular-injector` and it will become:

    someModule.factory('greeter', ['$window', function($window) {
      // ...
    }]);

You don't need to declare `ng` function anywhere and it could be customized to anything. If you wanted to get fancy, use something like `ƒ` or `∑` to never have any naming conflicts. Or even an emoji if you feeling wild.

This syntax works particularly well in CoffeeScript and is literally 2-3 extra characters:

    someModule.factory 'greeter', ng ($window) ->
      # ...

Then in your `Gruntfile.js` add configuration:

    grunt.initConfig({
      'angular-injector': {
        test: {
          expand: true,       // required
          token: 'ng',        // optional
          src: ['src/*.js'],
          dest: 'build/'
        }
      }
    });

**Please note that `expand: true` is required for this plugin.**

## Testing

    npm test

## License

The MIT License (MIT)

Copyright 2014 Alex Gorbatchev

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.