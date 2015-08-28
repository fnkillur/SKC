angular.module('ionicApp', ['ionic'])

.config(function($stateProvider, $urlRouterProvider) {

  $stateProvider
    // setup an abstract state for the tabss directive
    .state('tabs', {
      abstract: true,
      templateUrl: "tabs.html"
    })

    .state('tabs.home', {
      url: '/home',
      views: {
        'tabs-home': {
          templateUrl: 'home.html'
        }
      }
    })

    .state('tabs.about', {
      url: '/about',
      views: {
        'tabs-about': {
          templateUrl: 'about.html'
        }
      }
    })

    .state('tabs.settings', {
      url: '/settings',
      views: {
        'tabs-settings': {
          templateUrl: 'settings.html'
        }
      }
    })

    .state('bar', {
      url: "/bar",
      templateUrl: "bar.html",
      controller: function($scope){}
    });

   $urlRouterProvider.otherwise("/bar");

});