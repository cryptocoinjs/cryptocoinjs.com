FAQ
===

General Questions
-----------------

### 1. How is this different than [BitcoinJS][bitcoinjs] or [Bitcore][bitcore]?

CryptoCoinJS and Bitcore both derive their roots from an older version of BitcoinJS. For a long period of time BitcoinJS went unmaintained and many forks emerged. There was an opportunity to create a library that broke down each piece of functionality into its own module for the sake of making the library easier to use and easier to maintain. Let's face it, understanding Bitcoin is difficult, let alone programming with it - we as developers need to make things as easy as possible to attract faster innovation.

Since BitcoinJS is now maintained again and Bitpay has developers working full-time on Bitcore, both of these libraries are attractive options to use for your next Bitcoin/JavaScript project.

**Bitcore**: 

Pros:

- Bitpay has a put a lot of resources behind it and thus innovation is moving quickly.
- Feature complete.

Cons:

- It is owned and operated by Bitpay and thus the direction of the project will be at the whim of Bitpay and according to their business objectives.
- Large monolithic library.
- Poor documentation.
- Bitcoin only.


**BitcoinJS**:

Pros: 

- The one that started it all and will probably resemble most tutorials that have been written on the matter.
- Fast innovation again.
- Test coverage is improving a lot.

Cons:

- Large monolithic library.
- No documentation.
- Bitcoin only. (To be fair, they're open to supporting others)


** CryptoCoinJS**:

Pros:

- Smaller modules => makes it easier to understand, use, and maintain.
- Supports other crypto currencies.
- Decent documentation.

Cons:

- Lacks some functionality that the both BitcoinJS and Bitcore have.
- Test coverage could be improved.
- Innovation isn't happening as fast as BitcoinJS and Bitcore.

When it comes down to it, you should pick a library that helps you achieve your objective quickly while instilling confidence about its long-term viability. i.e. will the library be maintained in one year? While we can't make any concrete promises about the future, businesses rely upon CryptoCoinJS, so it should be actively developed for the foreseeable future.



Technical Questions
-------------------

### 1. How do I use these modules in the browser?

Assuming that you've gone through the [Getting Started](guide/getting-started), you'll need to install [Browserify](https://github.com/substack/node-browserify).

    npm install -g browserify

As an example, let's say that you want to use [coinkey](modules/coinkey) in the browser. Clone the repository:

    git clone https://github.com/cryptocoinjs/coinkey

Navigate into it:

    cd coinkey

Install dependencies:

    npm install

Run browserify:

    browserify --standalone CoinKey < lib/coinkey.js > coinkey.bundle.js

Include in a script in your HTML:

```html
<script src="coinkey.bundle.js"></script>
<script>
//since we passesd the --standalone flag to Browserify, "coinkey" will be global i.e. attached to `window`

var ck = new CoinKey();
</script>
```

**Note:** If you use more than one CryptoCoinJS module, you don't need to do this for each one. Assuming that you're using Browserify for your browser app, you'll only need to build with Browserify once with your top level `index.js` or `app.js` file.




[bitcoinjs]: https://github.com/bitcoinjs
[bitcore]: http://bitcore.io