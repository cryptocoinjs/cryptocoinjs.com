# Bitcoin P2P Manager
Manage a network of peers in a Bitcoin peer-to-peer network.

## Events
The BTCNetwork object translates the raw network messages received from the PeerManager into parsed objects. Here's the differences between the various events (Events are identified like `Object::EventName`):

* `Peer::message`: `{ peer: Peer, command: STRING, data: Buffer }` Raw message, fired for every message. Bubbled-up as `PeerManager::message`
* `BTCNetwork::message`: `{ peer: Peer, command: STRING, data: { version: INT, services: Buffer, time: INT, ...}` Parsed data
* `Peer::versionMessage`: `{ peer: Peer, data: Buffer }` Raw message. Bubbled-up by PeerManager as `PeerManager::versionMessage`
* `BTCNetwork::versionMessage`: `{ peer: Peer, version: INT, services: Buffer, time: INT, ... }` Parsed data

This is accomplished by several message handlers on the BTCNetwork object, named in the format `parseCommandMessage` (e.g. `parseVersionMessage`, `parseInvMessage`, `parseGetaddrMessage`, etc.). If a handler is not found for a message type, the raw form is bubbled up. To handle additional types of messages, add a parser method named appropriately, and it will be passed `data` as an argument, which is the message payload in Buffer form. It must return an object; if the result is an array (i.e `inv` messages), return an object with one property set to the array (i.e. `{ items: ARRAY }`).

In addition to a parser method, a `handleCommandMessage` method can be defined, which will be passed the parsed result, and `peer` as arguments, where `peer` is the Peer who sent the message.

These parsing methods mean, that if you're subscribed to an event stream that presents raw data (i.e. the `versionMessage` events from an individual Peer), you can parse them like:

```js
var p = new Peer('example.com');
var btc = new BTCNetwork();

p.on('versionMessage', function(d) {
  var parsed = btc.parseVersionMessage(d.data);
});
```