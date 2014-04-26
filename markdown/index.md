CryptoCoinJS
============

CryptoCoinJS is a JavaScript project that helps you to interface with many of the crypto currencies such as Bitcoin, Litecoin, Dogecoin, and more. Most of the modules are fully compatible with the browser and Node.js. Naturally, the modules that nterface directly with peer nodes won't run in the browser.


Principles
----------

We believe in the Node.js and UNIX philosophy - the idea of building small components that do one thing and do it well. Writing software in this manner allows individuals to use and contribute much more effectively than writing one monolithic library.

We believe that people are more important than code and therefore it's critical to write code that is easy to read, document each module with the API and examples, and that code is the enemy [1](http://blog.codinghorror.com/the-best-code-is-no-code-at-all/) [2](http://blog.codinghorror.com/size-is-the-enemy/).

We believe that writing tests is one of the best ways to communicate expectations between developers. If documentation is a way to commuincate for a consumer of your module, then tests are a way to communicate between devleopers.

We have our work cut out for us.



Platforms
---------

CryptoCoinJS is focused on Node.js and the browser using [Browserify](https://github.com/substack/node-browserify). We have made an active decision to NOT support legacy browsers. i.e. if your browser does not support [ECMAScript 5](http://en.wikipedia.org/wiki/ECMAScript) (2009-2010) and it doesn't support [window.crypto.getRandomValues()](https://developer.mozilla.org/en-US/docs/Web/API/window.crypto.getRandomValues) some of the modules may not work.



Modules
-------

### Active

#### Crypto Currency

##### Node.js / Browser

* [coininfo](modules/currency/coininfo.md) - Fetch currency specific information such as ports and version numbers
* [coinkey](modules/currency/coinkey.md) - Create private keys, public keys, and addresses. (Inherits from [eckey](modules/currency/eckey.md))
* [coinstring](modules/currency/coinstring.md) - Create, parse, or validate addresses a wallet import format strings
* [eckey](modules/currency/eckey.md) - Super class for [coinkey](modules/currency/coinkey) used for private and public elliptic curve keys


#### Cryptography

* [aes](modules/crypto/aes.md) - Implementation of the Advanced Encryption Standard
* pbkdf2-sha256
* ripemd160
* scryptsy



#### Misc

* [binstring](modules/misc/binstring.md) - Convert data types. i.e. convert between `Array`, `Buffer`, `UTF8`, `Hex`, etc.
* qr-encode 



### Deprecated

* ecurve-names - Moving curves to ecurve
* sha256 - Outsourced to [crypto-browserify][crypto-browserify]



Use In Production
-----------------

* [Coinbolt](https://www.coinbolt.com) - Simple & Secure Wallet
* [Helloblock](https://helloblock.io) - Block Explorer with Mainnet and Testnet API
* [Bitrated](https://www.bitrated.com) - Arbitration Marketplace

Do you use any of CryptoCoinJS? If so, let us know by emailing us or opening a pull request.



Want to Contribute?
-------------------

Please read: https://github.com/cryptocoinjs/cryptocoin/wiki/Contributor-Guidelines


Thanks
------

This library wouldn't be possible without some of the great work of [Stefan Thomas](https://github.com/justmoon), [Tom Wu](http://www-cs-students.stanford.edu/~tjw/), authors of [CryptoJS](https://code.google.com/p/crypto-js/), and authors of [SJCL](https://github.com/bitwiseshiftleft/sjcl/graphs/contributors). We owe them a heartfelt thank you for building the foundation for all of this.

Last, but surely not least, we owe [Satoshi Nakamoto](http://en.wikipedia.org/wiki/Satoshi_Nakamoto) for inventing what will surely be one of the greatest inventions of mankind.


[crypto-browserify]: https://github.com/dominictarr/crypto-browserify


