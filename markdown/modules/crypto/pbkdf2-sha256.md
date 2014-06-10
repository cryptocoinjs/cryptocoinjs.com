pbkdf2-sha256
=============

[![build status](https://secure.travis-ci.org/cryptocoinjs/pbkdf2-sha256.png)](http://travis-ci.org/cryptocoinjs/pbkdf2-sha256)
[![Coverage Status](https://img.shields.io/coveralls/cryptocoinjs/pbkdf2-sha256.svg)](https://coveralls.io/r/cryptocoinjs/pbkdf2-sha256)
[![Version](http://img.shields.io/npm/v/pbkdf2-sha256.svg)](https://www.npmjs.org/package/pbkdf2-sha256)


`pbkdf2-sha256` is a JavaScript implementation of [PBKDF2](http://en.wikipedia.org/wiki/PBKDF2) using the SHA256 HMAC. It's useful as the [Scrypt](http://en.wikipedia.org/wiki/Scrypt) algorithm uses this.  It's fully compatible with Node.js and the browser (via Browserify).



Package Info
------------
- github: [https://github.com/cryptocoinjs/pbkdf2-sha256](https://github.com/cryptocoinjs/pbkdf2-sha256)
- tests: [https://github.com/cryptocoinjs/pbkdf2-sha256/tree/master/test](https://github.com/cryptocoinjs/pbkdf2-sha256/tree/master/test)
- issues: [https://github.com/cryptocoinjs/pbkdf2-sha256/issues](https://github.com/cryptocoinjs/pbkdf2-sha256/issues)
- license: **BSD**
- versioning: [http://semver-ftw.org](http://semver-ftw.org)



Why?
----

This is useful for the [Scrypt](http://en.wikipedia.org/wiki/Scrypt) algorithm.

Why not just use the Node.js `pbkdf2` function? The Node.js `pbkdf2` function uses the `sha1` algorithm and not the `sha256` algorithm for its pseudorandom function. This will change when Node v0.12 is released. Until then, this is the next best option.



Installation
------------

    npm install --save pbkdf2-sha256


Example
-------

```js
var pbkdf2 = require('pbkdf2-sha256')

var key = 'passwd'
var salt = 'salt'
var res = pbkdf2(key, salt, 1, 64);
console.log(res.toString('hex')) // => 55ac046e56e3089fec1691c22544b605f94185216dde0465e68b9d57c20dacbc49ca9cccf179b645991664b39d77ef317c71b845b1e30bd509112041d3a19783
```


API
---

### pbkdf2(key, salt, iterations, keyLenBytes)

- **key**: The key to pass. Either `string` or `Buffer`.
- **salt**: The salt to pass. Either `string` or `Buffer`.
- **iterations**: The number of iterations. Should be type `number` (integer).
- **keyLenBytes**: The size of the result in bytes. Type `number` (integer).

Returns `Buffer`.



Misc
----

### Alternative Implementations

- https://github.com/bitwiseshiftleft/sjcl/blob/master/core/pbkdf2.js (Stanford JavaScript Crypto Library)
- https://code.google.com/p/crypto-js/source/browse/tags/3.1.2/src/pbkdf2.js (CryptoJS)

Why didn't I use either one of these? They're not Node.js optimized. They also don't use native types, so they'll be slower in the browser.




