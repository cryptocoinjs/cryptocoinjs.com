qr-encode
==========

[![build status](https://secure.travis-ci.org/cryptocoinjs/qr-encode.png)](http://travis-ci.org/cryptocoinjs/qr-encode)
[![Coverage Status](https://img.shields.io/coveralls/cryptocoinjs/qr-encode.svg)](https://coveralls.io/r/cryptocoinjs/qr-encode)
[![Version](http://img.shields.io/npm/v/qr-encode.svg)](https://www.npmjs.org/package/qr-encode)

JavaScript component to encode strings into QR codes. Works in both Node.js and the browser.


Package Info
------------
- github: [https://github.com/cryptocoinjs/qr-encode](https://github.com/cryptocoinjs/qr-encode)
- tests: [https://github.com/cryptocoinjs/qr-encode/tree/master/test](https://github.com/cryptocoinjs/qr-encode/tree/master/test)
- issues: [https://github.com/cryptocoinjs/qr-encode/issues](https://github.com/cryptocoinjs/qr-encode/issues)
- license: **MIT**


Install
-------

### Node.js/Browserify

    npm install --save qr-encode


QR Codes
--------

You should glance at this: http://en.wikipedia.org/wiki/QR_code

**Error Correction:**

- Level L (Low) 7% of codewords can be restored.
- Level M (Medium)  15% of codewords can be restored.
- Level Q (Quartile)  25% of codewords can be restored.
- Level H (High)  30% of codewords can be restored.



Usage
-----

```js
var qr = require('qr-encode')

var dataURI = qr("1F3sAm6ZtwLAUnj7d38pGFxtP3RVEvtsbV", {type: 6, size: 6, level: 'Q'})

//If using in browsers:
var img = new Image()
img.src = dataURI
document.body.appendChild(img)
```



Credits
-------

Most of the code: 
 
Copyright (c) 2009 Kazuhiko Arase

URL: http://www.d-project.com/

Licensed under the MIT license:
http://www.opensource.org/licenses/mit-license.php

The word 'QR Code' is registered trademark of
DENSO WAVE INCORPORATED
http://www.denso-wave.com/qrcode/faqpatent-e.html

Some of the code / techniques from:

https://github.com/MatthewMueller/qr-code
