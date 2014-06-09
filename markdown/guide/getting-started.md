Getting Started
===============

CryptoCoinJS is written in pure JavaScript and can be used on the server (Node.js) and the client (modern browser > 2010).


Text Editor
-----------

The first and probably most obvious is that you'll need a text editor. [Sublime Text](http://www.sublimetext.com/), [Github Atom](https://atom.io/), or Vim will make a fine choice.


Install Node.js
---------------

Node.js runs on Windows, Mac OS X, or Linux. It's very easy to install, just visit [http://nodejs.org/download/](http://nodejs.org/download/) and run the installer for your platform of choice. Node.js bundles [npm](https://www.npmjs.org/) which [oddly enough does not stand for Node.js Package Manager](https://www.npmjs.org/doc/faq.html) despite being its sole purpose.


### Note on Node.js Packages

The Node.js ecosystem contains many software modules or packages and it's growing exponentially. The common wisdom of the Node.js ecosystem is that it's best to write packages that do one thing well akin to the UNIX philosophy. Hence the CryptoCoinJS roots. You can view a list of packages here: [https://www.npmjs.org/](https://www.npmjs.org/)

Each Node.js package has a `package.json` file. To create your own, simply run:

    npm init

npm will ask you a series of questions and populate the `package.json` file accordingly.

Node.js packages typically have two types of dependencies characterized in `package.json`: these are `dependencies` and `devDependencies`. There's a third called `peerDependencies`, but that's out of scope for this article. `devDependencies` are dependencies that are used in devlopment only such as testing tools and build tools. `dependencies` are dependencies that your package depends upon in production.

To install a production dependency and have it update your package.json file:

    npm install --save coinkey

To intall a specific version:

    npm install --save coinkey@1.0.0

To install the latest:

    npm install --save coinkey@latest

To install a development dependency and have it update your package.json file:

    npm install --save-dev mocha



Generate a Bitcoin Address and Private Key
------------------------------------------

To read detailed description of private keys, public keys, and addresses checkout [http://procbits.com/2013/08/27/generating-a-bitcoin-address-with-javascript](http://procbits.com/2013/08/27/generating-a-bitcoin-address-with-javascript) by one of our contributors JP Richardson. It uses an old version of BitcoinJS, but you can open up your browser console and follow along with the tutorial.

First create your new app (if you already have an app, skip this step):

    npm init
    touch app.js #on windows, create the file in your text editor

install [coinkey](modules/coinkey) (at the time of this writing, version 0.1.0):

    npm install --save coinkey@1.0.0

edit app.js:

```js
var CoinKey = require('coinkey') //1.0.0

var ck = new CoinKey.createRandom()

console.log("Private Key (Wallet Import Format): " + ck.privateWif)
console.log("Private Key (Hex): " + ck.privateKey.toString('hex'))
console.log("Address: " + ck.publicAddress)
```

run it:
    
    node app.js

expected output will resemble:

    Private Key (Wallet Import Format): 5KcejEy2SaZPi5A3Ga3gfPR8c5WTepzw33enYTkVCwMCYnW3k8M
    Private Key (Hex): ecf8fdcdc516181757e45dbc91c62294a16150d532ccc9760a0911def1c07b75
    Address: 1H8kmcBuSuUokrNPszHU9baSvnfmFRNVky

it the address and private key (WIF) won't be the same since they are randomly generated. You can run it again and get an entirely different result.



Creating a CoinKey from a Private WIF:
--------------------------------------

Assuming same setup as the previous section, edit app.js:

```js
var CoinKey = require('coinkey') //1.0.0

var ck = CoinKey.fromWif('5KcejEy2SaZPi5A3Ga3gfPR8c5WTepzw33enYTkVCwMCYnW3k8M')
console.log("Address: " + ck.publicAddress)
```

expected output:

    Address: 1H8kmcBuSuUokrNPszHU9baSvnfmFRNVky

This will be the same everytime, since the public address is derived from the private key.



Creating a CoinKey from a Private Key:
--------------------------------------

Assuming same setup as previous, edit app.js:

```js
var CoinKey = require('coinkey') //1.0.0

var buffer = new Buffer('ecf8fdcdc516181757e45dbc91c62294a16150d532ccc9760a0911def1c07b75', 'hex')
var ck = new CoinKey(buffer)

console.log("Private Key (Wallet Import Format): " + ck.privateWif)
console.log("Private Key (Hex): " + ck.privateKey.toString('hex'))
console.log("Address: " + ck.publicAddress)
```

expected output:

    Private Key (Wallet Import Format): L5AMXSeHMu7yEHLu1irr4RwWZpu2dxrhW2hn1s4wVgt9xvyB3y2t
    Private Key (Hex): ecf8fdcdc516181757e45dbc91c62294a16150d532ccc9760a0911def1c07b75
    Address: 1LGdYYdJuFcxmghsm8dr6B4H27UJTtPcad


Generating a Dogecoin Address:
------------------------------

Assuming same setup as previous, install [coininfo](modules/coinfo) (0.1.0 at the time of this writing):

    npm install --save coininfo@0.1.0

```js
var CoinKey = require('coinkey')    //1.0.0
var coinInfo = require('coininfo')  //0.1.0

var dogeInfo = coinInfo('DOGE').versions

var ck = new CoinKey.createRandom(dogeInfo)

console.log("Private Key (Wallet Import Format): " + ck.privateWif)
console.log("Private Key (Hex): " + ck.privateKey.toString('hex'))
console.log("Address: " + ck.publicAddress)
```

expected output will resembled:

    Private Key (Wallet Import Format): QRtXV4kKKrocgUsdTk4uRP36vYH4CEQdn5KB7Y2WCqrkinSr6pBo
    Private Key (Hex): 61b0f83f28fbbcebeb4e3278883a7bdda8ffc7ff568dc5462bd2adb4ad01ca20
    Address: DFBF6aY3KurBDSf7CEhaPH3Zg8fJHfMToQ


Hopefully this tutorial was helpful in getting you started of programming for your favorite crypto currency and JavaScript!





