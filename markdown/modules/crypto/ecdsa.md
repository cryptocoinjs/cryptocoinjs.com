ecdsa
======

[![build status](https://secure.travis-ci.org/cryptocoinjs/ecdsa.png)](http://travis-ci.org/cryptocoinjs/ecdsa)
[![Coverage Status](https://img.shields.io/coveralls/cryptocoinjs/ecdsa.svg)](https://coveralls.io/r/cryptocoinjs/ecdsa)
[![Version](http://img.shields.io/npm/v/ecdsa.svg)](https://www.npmjs.org/package/ecdsa)

[![browser support](https://ci.testling.com/cryptocoinjs/ecdsa.png)](https://ci.testling.com/cryptocoinjs/ecdsa)

JavaScript component for Elliptical Curve Cryptography signing and verification. This package is important to sign transactions. Works 
with both Node.js and the browser.


Package Info
------------
- github: [https://github.com/cryptocoinjs/ecdsa](https://github.com/cryptocoinjs/ecdsa)
- tests: [https://github.com/cryptocoinjs/ecdsa/tree/master/test](https://github.com/cryptocoinjs/ecdsa/tree/master/test)
- issues: [https://github.com/cryptocoinjs/ecdsa/issues](https://github.com/cryptocoinjs/ecdsa/issues)
- license: **MIT**


Usage
-------

### Installation

    npm install --save ecdsa

### Example

```js
var crypto = require('crypto') //Node.js or Browserify (browser)

var ecdsa = require('ecdsa')
var sr = require('secure-random') //npm install --save secure-random@1.x
var CoinKey = require('coinkey') //npm install --save coinkey@0.1.0

var privateKey = sr.randomBuffer(32)
var ck = new CoinKey(privateKey, true) // true => compressed public key / addresses

var msg = new Buffer("hello world!", 'utf8')
var shaMsg = crypto.createHash('sha256').update(msg).digest()
var signature = ecdsa.sign(shaMsg, ck.privateKey)
var isValid = ecdsa.verify(shaMsg, signature, ck.publicKey)
console.log(isValid) //true
```

you could also use another curve, you'd probably never need to do this though:

```js
//curves defined here: https://github.com/cryptocoinjs/ecurve/blob/master/lib/names.js
var ecdsa = require('ecdsa')('secp160r1')
```


API
---

### calcPubKeyRecoveryParam

(TODO)


### deterministicGenerateK(hash, privateKey)

Used by `sign()` to securely and deterministically generate the K value. From [RFC 6979](http://tools.ietf.org/html/rfc6979).

- `hash`: Hash that is to be signed
- `privateKey`: The `BigInteger` representation of the private key


### parseSig(buffer)

Parses the signature and returns an object with `r` and `s` values.

- `buffer`: Is the DER encoded signature as type `Buffer`.


### parseSigCompact(buffer)

(TODO)


### recoverPubKey(e, signature, i)

(TODO)


### serializeSig(signature)

Serializes a signature object that contains `r` and `s` fields into a DER encoded signature with type `Buffer`.

- `signature`: signature object. Needs fields `r` and `s`.


### serializeSigCompact(signature, i ,compressed)

(TODO)


### sign(hash, privateKey)

Signs a hash. Typically used to sign crypto currency transactions. 

- `hash`: hash to sign. Type `Buffer`.
- `privateKey`: private key to sign with. Type `Buffer`.


### verify(hash, signature, publicKey)

Verifies that the hash is signed with the signature.

(TODO: add params)


### verifyRaw(e, signature, Q)

(TODO)






