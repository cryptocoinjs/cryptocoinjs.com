coininfo
========

JavaScript component for crypto currency specific information.
 


Installation
------------

    npm install --save coininfo


Usage
-----

```js
var coininfo = require('coininfo')
console.dir(coininfo('LTC')) 
// => 
/*
{ versions: 
   { public: 48,
     private: 176,
     scripthash: 5,
     bip32: { public: 27108450, private: 27106558 } } }
*/
```

Useful to use in conjunction with [coinkey](https://github.com/cryptocoinjs/coinkey) and [coinstring](https://github.com/cryptocoinjs/coinstring).


Supported
---------

<table class="table table-striped">
<tr>
  <th> Crypto Coin </th><th> Public Address </th><th> Private Wallet Import Format </th><th> Script Hash </th>
</tr>

<tr>
  <td> BTC </td><td> 0x00 </td><td> 0x80 </td><td> 0x05 </td>
</tr>
<tr>
  <td> BTC-TEST </td><td> 0x6F </td><td> 0xEF </td><td> 0xC4 </td>
</tr>

<tr>
  <td> DOGE </td><td> 0x1E </td><td> 0x9E </td><td> 0x16 </td>
</tr>
<tr>
  <td> DOGE-TEST </td><td> 0x71 </td><td> 0xF1 </td><td> 0xC4 </td>
</tr>


<tr>
  <td> LTC </td><td> 0x30 </td><td> 0xB0 </td><td> 0x05 </td>
</tr>
<tr>
  <td> LTC-TEST </td><td> 0x6F </td><td> 0xEF </td><td> 0xC4 </td>
</tr>


<tr>
  <td> NMC </td><td> 0x34 </td><td> 0xB4 </td><td> 0x05 </td>
</tr>

<tr>
  <td> PPC </td><td> 0x37 </td><td> 0xB7 </td><td> 0x75 </td>
</tr>

<tr>
  <td> URO </td><td> 0x44 </td><td> 0xC4 </td><td> 0x05 </td>
</tr>

</table>


Supported BIP32
--------------

<table class="table table-striped">
<tr>
  <th> Crypto Coin </th><th> Public </th><th> Private </th>
</tr>

<tr>
  <td> BTC </td><td> 0x0488b21e </td><td> 0x0488ade4 </td>
</tr>
<tr>
  <td> BTC-TEST </td><td> 0x043587cf </td><td> 0x04358394 </td>
</tr>

<tr>
  <td> DOGE </td><td> 0x02facafd</td><td> 0x02fac398 </td>
</tr>


<tr>
  <td> LTC </td><td> 0x019da462 </td><td> 0x019d9cfe </td>
</tr>

</table>





