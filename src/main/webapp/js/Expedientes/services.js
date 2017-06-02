carmenSanDiegoApp.factory('Villanos', function($resource) {
    return $resource('/villanos/:id', {'id': '@id'}, {
    	'query': { method: 'GET', isArray: true},
        'update': { method: 'PUT' },
        'save': { method: 'POST' },
        'remove': { method:'DELETE' }
    });
});

