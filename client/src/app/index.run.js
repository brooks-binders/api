(function() {
  'use strict';

  angular
    .module('bindersUi')
    .run(runBlock);

  /** @ngInject */
  function runBlock($log) {

    $log.debug('runBlock end');
  }

})();
