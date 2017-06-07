carmenSanDiegoApp.factory('Villano', function($resource) {
    return $resource('/villanos/:id', {'id': '@id'}, {
    	'get': { method: 'GET'},
        'update': { method: 'PUT' },
        'save': { method: 'POST' },
        'remove': { method:'DELETE' }
    });
});
carmenSanDiegoApp.factory('Villanos', function($resource) {
    return $resource('/villanos', {}, {
    	'query': { method: 'GET', isArray: true}
    });
});


