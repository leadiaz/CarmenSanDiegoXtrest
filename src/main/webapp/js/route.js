carmenSanDiegoApp.config(function ($stateProvider, $urlRouterProvider){
	$urlRouterProvider.otherwise("/home");

	$stateProvider

	.state('home',{
		url: "/home",
		templateUrl: "partials/home.html"
	})

		.state('mapamundi',{
		url: "/paises",
		templateUrl: "partials/Mapamundi/index.html"
	})

		.state('expedientes',{
		url: "/villanos",
		templateUrl: "partials/Expedientes/index.html"
	})

		.state('juego',{
		url: "/start",
		templateUrl: "partials/InicioDeJuego/index.html"
	})		
});