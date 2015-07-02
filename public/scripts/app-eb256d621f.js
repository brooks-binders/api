(function(){angular.module("client",["ngAnimate","ngCookies","ngTouch","ngSanitize","ngResource","ui.router","ui.bootstrap"])}).call(this),function(){angular.module("client").service("webDevTec",function(){var t,a;t=[{title:"AngularJS",url:"https://angularjs.org/",description:"HTML enhanced for web apps!",logo:"angular.png"},{title:"BrowserSync",url:"http://browsersync.io/",description:"Time-saving synchronised browser testing.",logo:"browsersync.png"},{title:"GulpJS",url:"http://gulpjs.com/",description:"The streaming build system.",logo:"gulp.png"},{title:"Jasmine",url:"http://jasmine.github.io/",description:"Behavior-Driven JavaScript.",logo:"jasmine.png"},{title:"Karma",url:"http://karma-runner.github.io/",description:"Spectacular Test Runner for JavaScript.",logo:"karma.png"},{title:"Protractor",url:"https://github.com/angular/protractor",description:"End to end test framework for AngularJS applications built on top of WebDriverJS.",logo:"protractor.png"},{title:"Bootstrap",url:"http://getbootstrap.com/",description:"Bootstrap is the most popular HTML, CSS, and JS framework for developing responsive, mobile first projects on the web.",logo:"bootstrap.png"},{title:"Angular UI Bootstrap",url:"http://angular-ui.github.io/bootstrap/",description:"Bootstrap components written in pure AngularJS by the AngularUI Team.",logo:"ui-bootstrap.png"},{title:"Sass (Node)",url:"https://github.com/sass/node-sass",description:"Node.js binding to libsass, the C version of the popular stylesheet preprocessor, Sass.",logo:"node-sass.png"},{title:"CoffeeScript",url:"http://coffeescript.org/",description:"CoffeeScript, 'a little language that compiles into JavaScript'.",logo:"coffeescript.png"},{key:"jade",title:"Jade",url:"http://jade-lang.com/",description:"Jade is a high performance template engine heavily influenced by Haml and implemented with JavaScript for node.",logo:"jade.png"}],a=function(){return t},this.getTec=a})}.call(this),function(){angular.module("client").directive("acmeNavbar",function(){var t,a;return t=function(t){var a;a=this,a.relativeDate=t(a.creationDate).fromNow()},a={restrict:"E",templateUrl:"app/components/navbar/navbar.html",scope:{creationDate:"="},controller:t,controllerAs:"vm",bindToController:!0}})}.call(this),function(){angular.module("client").directive("acmeMalarkey",function(){var t,a,n;return t=function(t,a){var n,e,o;o=this,n=function(){return e().then(function(){t.info("Activated Contributors View")})},e=function(){return a.getContributors(10).then(function(t){return o.contributors=t,o.contributors})},o.contributors=[],n()},n=function(t,a,n,e){var o,r;r=void 0,o=malarkey(a[0],{typeSpeed:40,deleteSpeed:40,pauseDelay:800,loop:!0,postfix:" "}),a.addClass("acme-malarkey"),angular.forEach(t.extraValues,function(t){o.type(t).pause()["delete"]()}),r=t.$watch("vm.contributors",function(){angular.forEach(e.contributors,function(t){o.type(t.login).pause()["delete"]()})}),t.$on("$destroy",function(){r()})},a={restrict:"E",scope:{extraValues:"="},template:"&nbsp;",link:n,controller:t,controllerAs:"vm"}})}.call(this),function(){angular.module("client").factory("githubContributor",["$log","$http",function(t,a){var n,e,o;return n="https://api.github.com/repos/Swiip/generator-gulp-angular",e=function(e){var o,r;return o=function(t){return t.data},r=function(a){t.error("XHR Failed for getContributors.\n"+angular.toJson(a.data,!0))},e||(e=30),a.get(n+"/contributors?per_page="+e).then(o)["catch"](r)},o={apiHost:n,getContributors:e}}])}.call(this),function(){angular.module("client").controller("MainController",["$timeout","webDevTec","toastr",function(t,a,n){var e,o,r,i;i=this,e=function(){o(),t(function(){i.classAnimation="rubberBand"},4e3)},r=function(){n.info('Fork <a href="https://github.com/Swiip/generator-gulp-angular" target="_blank"><b>generator-gulp-angular</b></a>'),i.classAnimation=""},o=function(){i.awesomeThings=a.getTec(),angular.forEach(i.awesomeThings,function(t){t.rank=Math.random()})},i.awesomeThings=[],i.classAnimation="",i.creationDate=1435814274451,i.showToastr=r,e()}])}.call(this),function(){angular.module("client").run(["$log",function(t){return t.debug("runBlock end")}])}.call(this),function(){angular.module("client").config(["$stateProvider","$urlRouterProvider",function(t,a){return t.state("home",{url:"/",templateUrl:"app/main/main.html",controller:"MainController",controllerAs:"main"}),a.otherwise("/")}])}.call(this),function(){angular.module("client").constant("malarkey",malarkey).constant("toastr",toastr).constant("moment",moment)}.call(this),function(){angular.module("client").config(["$logProvider","toastr",function(t,a){return t.debugEnabled(!0),a.options.timeOut=3e3,a.options.positionClass="toast-top-right",a.options.preventDuplicates=!0,a.options.progressBar=!0}])}.call(this),angular.module("client").run(["$templateCache",function(t){t.put("app/main/main.html",'<div class="container"><div><acme-navbar creationdate="main.creationDate"></acme-navbar></div><div class="jumbotron text-center"><h1>\'Allo, \'Allo!</h1><p class="lead"><img src="assets/images/yeoman.png" alt="I\'m Yeoman"><br>Always a pleasure scaffolding your apps.</p><p class="animated infinite" ng-class="main.classAnimation"><button type="button" class="btn btn-lg btn-success" ng-click="main.showToastr()">Splendid Toastr</button></p><p>With ♥ thanks to the contributions of<acme-malarkey extra-values="[\'Yeoman\', \'Gulp\', \'Angular\']"></acme-malarkey></p></div><div class="row"><div class="col-sm-6 col-md-4" ng-repeat="awesomeThing in main.awesomeThings | orderBy:\'rank\'"><div class="thumbnail"><img class="pull-right" ng-src="assets/images/{{ awesomeThing.logo }}" alt="{{ awesomeThing.title }}"><div class="caption"><h3>{{ awesomeThing.title }}</h3><p>{{ awesomeThing.description }}</p><p><a ng-href="{{awesomeThing.url}}">{{ awesomeThing.url }}</a></p></div></div></div></div></div>'),t.put("app/components/navbar/navbar.html",'<nav class="navbar navbar-static-top navbar-inverse"><div class="container-fluid"><div class="navbar-header"><a class="navbar-brand" href="https://github.com/Swiip/generator-gulp-angular"><span class="glyphicon glyphicon-home"></span> Gulp Angular</a></div><div class="collapse navbar-collapse" id="bs-example-navbar-collapse-6"><ul class="nav navbar-nav"><li class="active"><a ng-href="#">Home</a></li><li><a ng-href="#">About</a></li><li><a ng-href="#">Contact</a></li></ul><ul class="nav navbar-nav navbar-right acme-navbar-text"><li>Application was created {{ vm.relativeDate }}.</li></ul></div></div></nav>')}]);