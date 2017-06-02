carmenSanDiegoApp.factory('Caso', function($resource) {
    return $resource('/iniciarJuego', {}, {
        'iniciarJuego': { method: 'POST' },
    });
});

