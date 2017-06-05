carmenSanDiegoApp.factory('Caso', function($resource) {
    return $resource('/iniciarJuego', {}, {
        'iniciarJuego': { method: 'POST' },
    });
});

carmenSanDiegoApp.factory('Viajar', function($resource) {
    return $resource('/viajar', {}, {
        'viajar': { method: 'POST' },
    });
});

carmenSanDiegoApp.factory('Villanos', function($resource) {
    return $resource('/villanos/:id', {'id': '@id'}, {
    	'query': { method: 'GET', isArray: true},
    });
});

carmenSanDiegoApp.factory('OrdenDeArresto', function($resource) {
    return $resource('/emitirOrdenPara', {}, {
        'emitirOrden': { method: 'POST' },
    });
});

carmenSanDiegoApp.factory('Pista', function($resource) {
    return $resource('/pistaDelLugar', {}, {
    	'retornarPista': { method: 'GET'},
    });
});