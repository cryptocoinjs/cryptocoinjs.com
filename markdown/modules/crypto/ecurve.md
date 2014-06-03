ecurve
=======

[![build status](https://secure.travis-ci.org/cryptocoinjs/ecurve.png)](http://travis-ci.org/cryptocoinjs/ecurve)
[![Coverage Status](https://img.shields.io/coveralls/cryptocoinjs/ecurve.svg)](https://coveralls.io/r/cryptocoinjs/ecurve)
[![Version](http://img.shields.io/npm/v/ecurve.svg)](https://www.npmjs.org/package/ecurve)

[![browser support](https://ci.testling.com/cryptocoinjs/ecurve.png)](https://ci.testling.com/cryptocoinjs/ecurve)


JavaScript component for [Elliptic Curve Cryptography](http://en.wikipedia.org/wiki/Elliptic_curve_cryptography). Works in Node.js and the browser.


Package Info
------------
- github: [https://github.com/cryptocoinjs/ecurve](https://github.com/cryptocoinjs/ecurve)
- tests: [https://github.com/cryptocoinjs/ecurve/tree/master/test](https://github.com/cryptocoinjs/ecurve/tree/master/test)
- issues: [https://github.com/cryptocoinjs/ecurve/issues](https://github.com/cryptocoinjs/ecurve/issues)
- license: **MIT**


Usage
-----

### Installation

    npm install --save ecurve



### Examples

The `ecurve` module works closely with the `[bigi](http://cryptocoinjs.com/modules/misc/bigi/)`(BigInteger) module. So it may useful to 
require it in your code.


**Get ECParams object:**

```js
var ecurve = require('ecurve')

var ecparams = ecurve.getECParams('secp256k1')
console.log(ecparams.n.toString(16))
// => fffffffffffffffffffffffffffffffebaaedce6af48a03bbfd25e8cd0364141
console.log(ecparams.g.getEncoded().toString('hex')) //getEncoded() returns type 'Buffer' instead of 'BigInteger'
// => 0279be667ef9dcbbac55a06295ce870b07029bfcdb2dce28d959f2815b16f81798
console.log(ecparams.h.toString(16))
// => 1
```

** Computing Bitcoin Address from Private Key:**

```js
var crypto = require('crypto')

var BigInteger = require('bigi') //npm install --save bigi@1.1.0
var ecurve = require('ecurve') //npm install --save ecurve@0.6.0
var coinstring = require('coinstring') //npm install --save coinstring@0.2.0

var privateKey = new Buffer("1184cd2cdd640ca42cfc3a091c51d549b2f016d454b2774019c2b2d2e08529fd", 'hex')

var ecparams = ecurve.getECParams('secp256k1')
var curvePt = ecparams.g.multiply(BigInteger.fromBuffer(privateKey))
var x = curvePt.getX().toBigInteger().toBuffer(32)
var y = curvePt.getY().toBigInteger().toBuffer(32)

var publicKey = Buffer.concat([new Buffer([0x04]), x, y])
console.log(publicKey.toString('hex'))
// => 04d0988bfa799f7d7ef9ab3de97ef481cd0f75d2367ad456607647edde665d6f6fbdd594388756a7beaf73b4822bc22d36e9bda7db82df2b8b623673eefc0b7495

//alternatively
publicKey = curvePt.getEncoded(false) //false forces uncompressed public key
console.log(publicKey.toString('hex'))
// => 04d0988bfa799f7d7ef9ab3de97ef481cd0f75d2367ad456607647edde665d6f6fbdd594388756a7beaf73b4822bc22d36e9bda7db82df2b8b623673eefc0b7495

//want compressed?
publicKey = curvePt.getEncoded(true) //true forces compressed public key
console.log(publicKey.toString('hex'))
// => 03d0988bfa799f7d7ef9ab3de97ef481cd0f75d2367ad456607647edde665d6f6f

var sha = crypto.createHash('sha256').update(publicKey).digest()
var pubkeyHash = crypto.createHash('rmd160').update(sha).digest()

// pubkeyHash of compressed public key
console.log(pubkeyHash.toString('hex')) 
// => a1c2f92a9dacbd2991c3897724a93f338e44bdc1

// address of compressed public key
console.log(coinstring(0x0, pubkeyHash)) 
// => 1FkKMsKNJqWSDvTvETqcCeHcUQQ64kSC6s 
```


API
---

`ecurve` exports the following:

### getECParams(curveString)

Use this to get the Bitcoin (all crypto currencies as well) curve parameters: `secp256k1`.


### ECCurveFp

(TODO)

### ECPointFp

(TODO)

### ECFieldElementFp

(TODO)



References
----------
- [Generating a Bitcoin Address](http://procbits.com/2013/08/27/generating-a-bitcoin-address-with-javascript).




