coinstring
==========

[![build status](https://secure.travis-ci.org/cryptocoinjs/coinstring.png)](http://travis-ci.org/cryptocoinjs/coinstring)
[![Coverage Status](https://img.shields.io/coveralls/cryptocoinjs/coinstring.svg)](https://coveralls.io/r/cryptocoinjs/coinstring)
[![Version](http://img.shields.io/npm/v/coinstring.svg)](https://www.npmjs.org/package/coinstring)

[![browser support](https://ci.testling.com/cryptocoinjs/coinstring.png)](https://ci.testling.com/cryptocoinjs/coinstring)

JavaScript component that's used to generate relevant addresses, wallet import formats, BIP32 encodings, and [base 58 check encoding](https://en.bitcoin.it/wiki/Base58Check_encoding)
used by various crypto currencies. The difference between this and base58 check encoding is not much other than base 58 check encoding
specifies that the version should only have one byte. This means that base 58 check encoding technically would NOT work for BIP 32
addresses, but this module does work with BIP 32 addresses.

Works in Node.js and the browser.


Package Info
------------
- github: [https://github.com/cryptocoinjs/coinstring](https://github.com/cryptocoinjs/coinstring)
- tests: [https://github.com/cryptocoinjs/coinstring/tree/master/test](https://github.com/cryptocoinjs/coinstring/tree/master/test)
- issues: [https://github.com/cryptocoinjs/coinstring/issues](https://github.com/cryptocoinjs/coinstring/issues)
- license: **MIT**
- versioning: [http://semver-ftw.org](http://semver-ftw.org)


Installation
------------

    npm install coinstring --save


Examples
--------

**Note:** You'd commonly use this package in conjunction with [coininfo](http://cryptocoinjs.com/modules/currency/coininfo/).

### Convert Private Key to Bitcoin Wallet Import Format

```js
var cs = require('coinstring')

var privateKeyHex = "1184cd2cdd640ca42cfc3a091c51d549b2f016d454b2774019c2b2d2e08529fd"
var privateKeyHexBuf = new Buffer(privateKeyHex, 'hex')
var version = 0x080; //Bitcoin private key

console.log(cs.encode(privateKeyHexBuf, version)) 
// => 5Hx15HFGyep2CfPxsJKe2fXJsCVn5DEiyoeGGF6JZjGbTRnqfiD
```


### Convert hash160 (aka pubKeyHash) to Bitcoin Address

```js
var cs = require('coinstring')

var hash160 = "3c176e659bea0f29a3e9bf7880c112b1b31b4dc8" //hash representing uncompressed
var hash160Buf = new Buffer(hash160, 'hex')
var version = 0x00; //Bitcoin public address

console.log(cs.encode(hash160Buf, version)); 
// => 16UjcYNBG9GTK4uq2f7yYEbuifqCzoLMGS
```


#### Convert Private Key to Compressed Bitcoin Wallet Import Format

```js
var cs = require('coinstring')

var privateKeyHex = "1184cd2cdd640ca42cfc3a091c51d549b2f016d454b2774019c2b2d2e08529fd"

//for compressed, append "01"
privateKeyHex += '01'

var privateKeyHexBuf = new Buffer(privateKeyHex, 'hex')
var version = 0x080 //Bitcoin private key

console.log(cs.encode(privateKeyHexBuf, version))
// => KwomKti1X3tYJUUMb1TGSM2mrZk1wb1aHisUNHCQXTZq5auC2qc3
```


#### Convert hash160 (aka pubkeyhash) to Dogecoin Address

```js
var cs = require('coinstring')

var hash160 = "3c176e659bea0f29a3e9bf7880c112b1b31b4dc8" //hash representing uncompressed
var hash160Buf = new Buffer(hash160, 'hex')
var version = 0x1E //Dogecoin public address

console.log(cs.encode(hash160Buf, version)) 
// => DAcq9oJpZZAjr56RmF7Y5zmWboZWQ4HAsW
```


### Encode BIP 32 Bitcoin Private Key

Base 58 check encoding cannot typically enocde these since it requires the version to only be one byte. Read more about
[BIP32 here](https://github.com/bitcoin/bips/blob/master/bip-0032.mediawiki).

```js
var cs = require('coinstring')

var data = "000000000000000000873dff81c02f525623fd1fe5167eac3a55a049de3d314bb42ee227ffed37d50800e8f32e723decf4051aefac8e2c93c9c5b214313817cdb01a1494b917c8436b35" 
var buffer = new Buffer(data, 'hex')
var version = new Buffer('0488ade4', 'hex') //0488ade4 is a consant listed in the aforementioned bip32 wiki.

console.log(cs.encode(buffer, version)) 
// => xprv9s21ZrQH143K3QTDL4LXw2F7HEK3wJUD2nW2nRk4stbPy6cq3jPPqjiChkVvvNKmPGJxWUtg6LnF5kejMRNNU3TGtRBeJgk33yuGBxrMPHi
```


### Decode Bitcoin Private Wallet Import Format (WIF) to private key

```js
var cs = require('coinstring')

var res = cs.decode('5Hx15HFGyep2CfPxsJKe2fXJsCVn5DEiyoeGGF6JZjGbTRnqfiD')
console.log(res.version.toString('hex')) // => 80
console.log(res.payload.toString('hex')) // => 1184cd2cdd640ca42cfc3a091c51d549b2f016d454b2774019c2b2d2e08529fd
``` 


### Functional Goodies

`coinstring` also has some functional goodies. 

#### Function to Generate Bitcoin Wallet Import Format

```js
var cs = require('coinstring')

var privateKeyHex = "1184cd2cdd640ca42cfc3a091c51d549b2f016d454b2774019c2b2d2e08529fd";
var privateKeyHexBuf = new Buffer(privateKeyHex, 'hex')
var version = 0x080 //Bitcoin private key

var toBtcWif = cs.createEncoder(version)

//later in your program
console.log(toBtcWif(privateKeyHexBuf)) 
// => 5Hx15HFGyep2CfPxsJKe2fXJsCVn5DEiyoeGGF6JZjGbTRnqfiD
```


#### Function to Parse Bitcoin Wallet Import Format

```js
var cs = require('coinstring');

var wif = "5Hx15HFGyep2CfPxsJKe2fXJsCVn5DEiyoeGGF6JZjGbTRnqfiD"
var version = 0x080 //Bitcoin private key

var fromBtcWif = cs.createDecoder(version)

//later in your program
console.log(fromBtcWif(wif).payload.toString('hex')) 
// => 51184cd2cdd640ca42cfc3a091c51d549b2f016d454b2774019c2b2d2e08529fd
```

#### Function to Validate Bitcoin Testnet Addresses

```js
var cs = require('coinstring');

var hash160 = "3c176e659bea0f29a3e9bf7880c112b1b31b4dc8" //hash representing uncompressed
var hash160Buf = new Buffer(hash160, 'hex')
var version = 0x6F //Bitcoin Testnet Address

var testnetAddressValidator = cs.createValidator(version)
console.log(testnetAddressValidator("mkzgubTA5Ahi6BPSkE6MN9pEafRutznkMe")) // => true
```



API
---

`coinstring` exports the following six functions:


### encode(payload, version)

Used to convert either a hash160 or private key into an address or wallet import format string respectively.

- `payload`: A `Buffer`, `Array`, or `Uint8Array` of bytes, either the hash160 or private key.
- `version`: Is an integer representing the version or a `Buffer` if version is greater than one byte. The case where it's typically
greater than one byte is for working with BIP32.

Returns the base58 encoded value of type `string`.


### decode(base58str, [version])

It is the inverse of the `encode()` function i.e. it converts the address or wallet import format into a `Buffer` of bytes. It
throws if the address or wallet import format is not valid. Not valid means that the version doesn't match, or the checksum is
incorrect. 

- `base58str`: A `string` that is either the wallet import format or public address.
- `version`: Is an integer representing the version or `Buffer`. See below for more information.

Returns an object with the follow fields `version` of type `Buffer` and `payload` of type `Buffer`.


### isValid(base58str, version)

Validates whether the address string or wallet import format string is valid. 

- `base58str`: A `string` that is either the wallet import format or public address.
- `version`: Is an integer representing the version or `Buffer`. See below for more information.

Returns a `true` or `false`.


### createEncoder(version)

Returns a function that takes as input the `payload` like from `encode()` above.


### createDecoder(version)

Returns a function that takes as input the `base58str` like from `decode()` above.


### createValidator(version)

Returns a function that takes as input the `base58str` like from `isValid()` above.



List of Common Crypto Currency Versions
---------------------------------------

The following is a table of common crypto currency versions. It may seem a bit user unfriendly to have to input the number instead of something like "BTC"; we agree. Another module will be created to address this. In the meantime, use the table below.

<table>
<tr><th>Crypto Coin</th><th>Public Address</th><th>Private Wallet Import Format</th></tr>
<tr><td>Bitcoin</td><td> 0x00</td><td> 0x80</td></tr>
<tr><td>Bitcoin Script Hash</td><td> 0x05</td><td> N/A</td></tr>
<tr><td>Bitcoin Testnet</td><td> 0x6E</td><td> 0xEF</td></tr>
<tr><td>Bitcoin Testnet Script Hash</td><td> 0xC4</td><td> N/A</td></tr>
<tr><td>Dogecoin</td><td> 0x1E</td><td> 0x9E</td></tr>
<tr><td>Litecoin</td><td> 0x30</td><td> 0xB0</td></tr>
<tr><td>Namecoin</td><td> 0x34</td><td> 0xB4</td></tr>
</table>

You may also want to just use the module [coininfo](http://cryptocoinjs.com/modules/currency/coininfo/) instead.



Use in the Browser
-----------------

Clone the repo:

    git clone https://github.com/cryptocoinjs/coinstring

Install Browserify

    npm install -g browserify

Nav to repo:

    cd coinstring

Install dependencies:

    npm install

Run browserify:

    browserify --standalone coinstring < lib/coinstring.js > lib/coinstring.bundle.js

You can now drop `coinstring.bundle.js` in a `<script>` tag.



References
----------
- http://procbits.com/2013/08/27/generating-a-bitcoin-address-with-javascript
- http://brainwallet.org/




