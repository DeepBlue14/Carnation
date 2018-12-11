//Source: https://www.npmjs.com/package/couchdb

var couchdb = require('couchdb');
var client  = couchdb.createClient(5984, 'localhost');
var db      = client.db('helloCouch');

var doc = { _id: 'helloCouch', text: 'Hello CouchDB!' };

db.saveDoc(doc).then(function() {
	console.log('document saved!');

	db.openDoc('helloCouch').then(function(doc) {
		console.log('retrieved document!');
		console.log(JSON.stringify(doc));
	});
});
