(function() {
  'use strict';

  angular
    .module('clipbooksApp')
    .run(runBlock);

  /** @ngInject */
  function runBlock($log) {

    $log.debug('runBlock end');
  }

})();
