
carmenSanDiegoApp.factory('Paises', function($resource) {
    return $resource('/paises/:id', {'id': '@id'}, {
    	'get' : {method: 'GET'},
    	
        'update': { method: 'PUT' },
        'save': { method: 'POST' },
        'remove': { method:'DELETE' }
    });
});

carmenSanDiegoApp.factory('Paises', function($resource) {
    return $resource('/paises', {}, {
    	'query': { method: 'GET', isArray: true},
    }