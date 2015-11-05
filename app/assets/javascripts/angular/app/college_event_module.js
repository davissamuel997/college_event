var collegeEvent = angular.module('zombieBox', 
	[
		'ngResource',
		'ui.bootstrap',
		'localytics.directives',
		'pusher-angular'
	]).config(function(datepickerConfig, datepickerPopupConfig) {
		datepickerConfig.showWeeks = false;
		datepickerPopupConfig.toggleWeeksText = null;
	});
	
collegeEvent.run(function($rootScope, $templateCache) {
   $rootScope.$on('$viewContentLoaded', function() {
      $templateCache.removeAll();
   });
});