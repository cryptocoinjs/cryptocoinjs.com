Contents
--------
1. [Purpose](http://cryptocoinjs.com/about/contributing/#purpose)
2. [Principles](http://cryptocoinjs.com/about/contributing/#principles)
3. [Repository Management](http://cryptocoinjs.com/about/contributing/#repository-management)
4. [Effective JavaScript](http://cryptocoinjs.com/about/contributing/#effective-javascript)
5. [Licensing](http://cryptocoinjs.com/about/contributing/#licensing)
6. [Living Document](http://cryptocoinjs.com/about/contributing/#living-document)



Purpose
-------

This guide is a brief reference to how code should be written for CryptoCoinJS. This applies to organiztion members and contributors.



Principles
----------
1. People matter more than code. Optimize for people.
2. Write code for humans to read. It's easier to write code than to read code. Avoid verbosity, but don't be overly terse.
3. Code is the enemy. Lines of code should be reduced as much as possible. [The best code is no code at all](http://www.codinghorror.com/blog/2007/05/the-best-code-is-no-code-at-all.html) and [Size is the enemy](http://www.codinghorror.com/blog/2007/12/size-is-the-enemy.html). This is probably the most important principle.
4. Organize according to the UNIX philosophy: small and simple modules that do one thing well. Take into consideration the [Single Responsibility Principle](http://en.wikipedia.org/wiki/Single_responsibility_principle)
5. All code in this project should look like one person wrote it. We have a lot of work in this area.
6. Code should be documented (not auto-generated). But it should not be "documented" in the actual code. Documentation should emphasize usage examples and not so much API interface signatures. It's not that API docs are bad, they should just be made lower priority when compared to usage examples.
7. Tests should be implemented. 


Repository Management
---------------------

### Creating

Each new repository should contain the following file structure to start:

```
.
├── CHANGELOG.md
├── LICENSE
├── README.md
└── test/

1 directory, 3 files
```


### License

Please license a new project or module under MIT if possible. If the code is largely based from another project, then it may be 
prudent to use that license. Only other acceptable licenses are BSD 2, BSD 3, and Apache v2. 


### Versioning

Adhere to [semver-ftw.org](http://semver-ftw.org/) if possible. Fallback to [semver](http://semver.org/) if necessary. Each package should comply with the  guidelines. Here's the slightly modified summary:

npm has unexpected behavior for those who are unfamiliar. Essentialy, versions less than `1.0.0` are treated differently. So, it may be best to start the module with `1.0.0` and just adhere to semver-ftw.org.


### Git

When preparing a release, make sure everything is committed but the `CHANGELOG.md`, `package.json` files are committed on version commits. The only changes should be the `version` number in the package files. Then commit like:

```sh
git add CHANGELOG.md package.json
git commit -m  x.y.z #whatever the version number is (no v prefix!!)
```

It's very important to tag!

```sh
git tag -a x.y.z #no v prefix!
```

Your default editor will open, make sure to paste in the latest CHANGELOG information including the version and date.

Don't forget to push to Github and publish to NPM:

```sh
git push && git push --tags
npm publish
```


### CHANGELOG management

The changelog should contain anything significant about the update. This includes any references to issues, issues closed, bugs fixed, new features, etc. 

Please follow these guidelines:

1. It should not just be a copy and paste of all of the commit output. The changelog is for consumers of our software and not developers of the software.
2. It should not be vague. "A few tweaks and bug fixes is not acceptable." If all software packages had changelogs, the software world would have less bugs, so let's do a our part.
3. It doesn't have to be overly detailed, a brief sentence is fine for each change. References to issues are very helpful.
4. If your commit is helpful for a changelog, by all means include it. 

Example of preferable format:
```markdown
0.0.1 / 2013-11-05
------------------
- implemented method `foo()`.
- fixed a bug that prevented method `bar()` from outputting. Closes #23  //<-- Github automatically links to the issue in the release page
```

Make sure the headings contain the version number and date. Date should be in the form of `YYYY-MM-dd`.


### Travis CI

Use it. Add the badge to the README.


### Coveralls

Use it. Add the badge to the README.




Effective JavaScript
--------------------

### Compatibility

We are not interested in supporting legacy browsers. [ES5](http://en.wikipedia.org/wiki/ECMAScript) target should be satisfactory. This pretty much includes all modern browsers and > IE9. If you want legacy browser support, resort to polyfills.

CommonJS and `script` tag support only. AMD is not welcome at this time. Package manager priority should be given to Node.js and `package.json`. [Component](https://github.com/component/component) and [Bower](https://github.com/bower/bower) should be considered, but not prioritized. [Tin](https://github.com/jprichardson/tin) makes managing these package files a little less painful.



### Testing

Tests are critical to building and maintaining working software. Tests should be seen as a contract between the software and expectations. Tests yield dividends in the long run. Currently [Mocha](http://visionmedia.github.io/mocha/) is the preferred test runner with the [BDD interface](http://visionmedia.github.io/mocha/#interfaces). Most of the tests were written using the [Terst](https://github.com/jprichardson/terst) testing library. I prefered this because it's extremely terse and is still very readable without being overly verbose. However, for a project this large, we need to use a "common language" and thus Node.js [assert](http://nodejs.org/api/assert.html) module should be the standard. 

 
### Indentation


#### Two Spaces

Two spaces. No negotiation on this one.

```js
console.log('indent demo');
if (true) {
  console.log('indent 1');
  if (true) {
    console.log('indent two');
  }	
}
```

#### Minimize Indentation Levels / Early Returns Encouraged

Early returns can increase readability. Remember principle #3? 

Don't do this:

```js
fs.readFile('/no/way/jose.txt', function(err, file) {
  if (err) {
    console.error(err);	
  } else {
    //do something else	
  }
});
```

Do this instead (if possible):

```js
fs.readFile('/no/way/jose.txt', function(err, file) {
  if (err) return console.error(err);
  //do something else	
});
```


### Semicolons

No.

If it's good enough for the old maintainer of Node.js (Isaac S), Thomas Fuchs, and Jacob Thorton (Fat) creator of Bootstrap to skip them, and BitcoinJS, to skip them, then we'll skip them too.

Further reading:
- http://wordsbyf.at/2011/10/31/i-dont-write-javascript/
- http://dailyjs.com/2012/04/19/semicolons/
- http://blog.izs.me/post/2353458699/an-open-letter-to-javascript-leaders-regarding
- http://inimino.org/~inimino/blog/javascript_semicolons



### Naming

(straight from Google's reference, except for the caveat on file names)

In general, use `functionNamesLikeThis`, `variableNamesLikeThis`, `ClassNamesLikeThis`, `EnumNamesLikeThis`, `methodNamesLikeThis`, `CONSTANT_VALUES_LIKE_THIS`, `foo.namespaceNamesLikeThis.bar`, and `filenameslikethis.js`. If you need to break up a long file name, use `-` and not `_` or different cases.

Avoid hungarian notation. It sucks and makes no sense in the JavaScript environment. There may be some rare exceptions here.



### Comments

It's more important to comment why something was done than to comment what is done. If you have to comment what the code does, the code may not be clear enough. Don't go overboard though with Java style verbosity.

**JSDoc is not acceptable.** It completely violates principle #3 and just adds noise. **Generating documentation from code is lazy practice and poor behavior.**

As far as the format of comments, there isn't any explicit style as of this moment. Use what works best for you. Style will develop organically.


### Parenthesis, Commas, and Spaces

No spacing before or after parenthesis. Spaces after commas in methods.

Don't do this:

```js
//NO
someFunc( 10, 20 );

//NO
function someFunc ( n, m ) {
  console.log( 'too many spaces' );
}
```

Do this:

```js
//YES
someFunc(10, 20);

//YES
function someFunc(n, m) {
  console.log('too many spaces');
}
```


### Type Coercion

Terse code is encouraged IF its behavior is well defined. For example:

Prefer `===` and `!==`. Only use `==` and `!=` where it makes sense.

**null/undefined:**
```js
//this is good
function something(input) {
  if (input == null) { //this is acceptable terse way to check for `null` and `undefined`
    //do something
  }
}
```

**typeof:**
```js
//typeof always returns a string, no need for ===
if (typeof val == 'string') //this is good
```

**float:**
```js
var num = +'3433.22'; //this is acceptable as it's well known
num = parseFloat('3433.22'); //<--- probably preferred

var num2 = +'343.22 hi'; //be careful though, NaN
num2 = '343.22 hi'; //expected, 343.22
```

**integer:**
```js
var num = ~~'3433.22'; //this is acceptable as well
num = parseInt('3433.22', 10); //<-- preferred
```

**bool:**
```js
var b = !!'4'; //true
var c = !!'0'; //false
```



### Quotes

Prefer `'` instead of `"`. This makes it easier to embed HTML. The obvious exception is that if your string needs to actually contain `'` character.


### Properties

Do not use `setFoo` and `getFoo` notation. Leverage ES5 properties. 

Use [`Object.defineProperty()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/defineProperty).



### Other JavaScript Style Guides

These other guides are very popular. They differ slightly.

1. https://github.com/airbnb/javascript
2. http://google-styleguide.googlecode.com/svn/trunk/javascriptguide.xml
3. https://github.com/rwaldron/idiomatic.js



Licensing
----------
By contributing, you implicitly agree that all code that you contribute will be licensed under MIT. The only exception to this rule is that if you leverage a 3rd party library that is licensed in some other manner. Examples: code from CryptoJS, Stanford JavaScript Library, etc.


Living Document
---------------
The goal is to try to encourage code that's generally accepted by most JavaScript developers as clean and readable. As such, I will have no doubt made some mistakes and boneheaded decisions here. If it makes sense to change any of these rules, let's discuss. This document may be subject to change.
