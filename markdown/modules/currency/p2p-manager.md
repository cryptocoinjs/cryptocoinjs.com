# P2P Manager
Manage a network of peers in a peer-to-peer network.

## Messages

### `peerConnect`, `peerEnd`, `peerError`
Emitted when an active Peer emits a `connect`, `end` or `error` message respectively, and the data payload is the same:

```
{
  peer: Peer
}
```

### `peerMessage`
Emitted when an active Peer sends a `message` event.

```
{
  peer: Peer,
  command: String,
  data: Raw payload as binary data
}
```

### `commandMessage`
An alternate version of the `peerMessage` event; in these events, the command of the message is used as the event name (i.e. command `'foo'` would cause a `fooMessage` event).

```
{
  peer: Peer,
  data: Raw payload as binary data
}
```

### `error`
Error message from the PeerManager. The `severity` attribute is one of 'info', 'notice', 'warning', or 'error' (in increasing severity). 

```
{
  severity: String,
  message: String
}
```

## `PeerManager.send()`
The PeerManager allows sending messages to a collection of Peers at once, based on certain criteria. The most common criteria is the "state" of the Peer. Each Peer object has a `state` property which is set to `'new'` when first created, `'connecting'` when first opened, and `'connected'` when first `connect` event is heard (before `handleConnect` is called, so that can be overwritten, if desired). Any other states are up to your PeerManager instance to implement.

* `number`: How many peers to send to? Once filtered down, should all or a sub-set be messaged? Pass a Number to send to that many Peers (picked at random). Passing a zero or negative number for this argument sends to all matched Peers.
* `prop`: (String) Which property of the Peers should be examined?
* `value`: Value of the property the Peers need to match to be included in the set. Matching is done in a case-insensitive way for strings. Passing an array for this argument requires Peers match any one of the array's values.
* `cmd`: (String) Message name to be sent to the Peers
* `payload`: (Buffer) Binary data to be sent to the Peers
* `answerCmd`: (String) Message name of answering message. If null/false, defaults to all `message` events.
* `callback`: (function) If provided, is bound to the "`answerCmd`" event of the Peers contacted, to await their reply

```js
PeerManager.send('all', 'state', 'connected', 'hi', new Buffer([1,2,3,4,5])); // Send a message to all connected clients
PeerManager.send(2, 'state', 'lonely', 'matchmaker', new Buffer([1,2,3,4,5])); // Send a message to a random two Peers who have state=='lonely'
PeerManager.send(5, 'myProp', [1,5,42,false], 'hi', new Buffer([1,2,3,4,5])); // Send a message to a random five Peers who have myProp equal to either 1, 5 ,42, or false
```

The function returns an dictionary of Peers the message was sent to, stored by their UUID.

If you're expecting a specific answer to your message, there's a few ways you can listen in:

### Listen to only answer messages, from just the filtered peers
Probably the most common, and the most specific listening type:

```js
var m = new PeerManager();
var waitForAnswer = function(d) {
  console.log(d.peer.getUUID()+': has answered', d.data.toString('hex'));
  d.peer.removeListener('message', this); // This listener doesn't care about further messages
  delete peers[d.peer.getUUID()]; // Remove this peer from the list of peers who haven't answered yet
};

var peers = m.send(2, 'state', 'waiting', 'knock', new Buffer([1,2,3]), 'answer', waitForAnswer);

setTimeout(function() {
  // Ten seconds have passed; give up on those who haven't answered
  for (var uuid in peers) {
    if (peers.hasOwnProperty(uuid)) {
      console.log(uuid+' never answered...');
      peers[uuid].removeListener('message', waitForAnswer);
    }
  }
}, 10000);
```

### Listen to all messages, from just the filtered Peers 
A good method if you expect the answer you seek to be in the next few messages from those Peers, and the answer might be one of several messages ('answer' or 'error'):

```js
var m = new PeerManager();
var waitForAnswer = function(d) {
  if (d.command !== 'answer') return; // Wait for next message...
  
  console.log(d.peer.getUUID()+': has answered', d.data.toString('hex'));
  d.peer.removeListener('message', this); // This listener doesn't care about further messages
  delete peers[d.peer.getUUID()]; // Remove this peer from the list of peers who haven't answered yet
};

var peers = m.send(2, 'state', 'waiting', 'knock', new Buffer([1,2,3]), false, waitForAnswer);

setTimeout(function() {
  // Ten seconds have passed; give up on those who haven't answered
  for (var uuid in peers) {
    if (peers.hasOwnProperty(uuid)) {
      console.log(uuid+' never answered...');
      peers[uuid].removeListener('message', waitForAnswer);
    }
  }
}, 10000);
```

### Listen to only answer messages, from all Peers
If there are lots of other messages being sent around, but very few of the particular answer messages you're looking for, this works well, or if there's a possibility another peer will answer on behalf of the peer you requested from:

```js
var m = new PeerManager();
var waitForAnswer = function(d) {
  // Look through our list of peers and see if d.peer is one of them
  if (peers[d.peer.getUUID()] !== d.peer) return;
  
  console.log(d.peer.getUUID()+': has answered', d.data.toString('hex'));
  delete peers[d.peer.getUUID()]; // Remove this peer from the list of peers who haven't answered yet
};
var peers = m.send(2, 'state', 'waiting', 'knock', new Buffer([1,2,3]));
m.on('answer', waitForAnswer); // Listen in on all 'answer' messages from all peers

setTimeout(function() {
  // Ten seconds have passed; give up on those who haven't answered
  for (var uuid in peers) {
    if (peers.hasOwnProperty(uuid)) {
      console.log(uuid+' never answered...');
    }
  }
  m.removeListener('answer', waitForAnswer);
}, 10000);
```

## Peers
The PeerManager keeps a list of known Peers to connect to (the "pool"), as well as a list of those currently connected ("active").

As your implementation discovers new Peers, use the `PeerManager.addPool(hosts)` method to tell the PeerManager about them. If the number of active Peers is currently below the minimum (`options.minPeers`), a connection will be attempted immediately. Otherwise, they will just be added to the pool. `PeerManager.addActive(hosts)` adds a new peer and attempts to connect to it immediately, regardless if the number of active Peers is above the threshhold.

## Peer lists
The `seedPeers` argument of `launch()`, and the `hosts` argument of `addPool()` and `addActive()` are lists of hosts, expressed one of the following ways:

* If it's a String, it's assumed to be the hostname/ip of one host to use; make sure to include a port number as part of the hostname (colon-delimited).
* If it's an Array, it's looped through and each element inspected.
* * If it's a String, it's assumed to be a hostname/ip of a host to use.
* * If it's an Array, index zero is used as host and index one is used as port.
* * If it's an Object, the `host` property is used as host, and the `port` property is used as port.