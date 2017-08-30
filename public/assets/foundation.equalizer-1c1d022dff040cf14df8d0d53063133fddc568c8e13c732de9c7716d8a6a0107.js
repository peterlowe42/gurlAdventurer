!function(e){function t(n){if(i[n])return i[n].exports;var o=i[n]={i:n,l:!1,exports:{}};return e[n].call(o.exports,o,o.exports,t),o.l=!0,o.exports}var i={};t.m=e,t.c=i,t.i=function(e){return e},t.d=function(e,i,n){t.o(e,i)||Object.defineProperty(e,i,{configurable:!1,enumerable:!0,get:n})},t.n=function(e){var i=e&&e.__esModule?function(){return e["default"]}:function(){return e};return t.d(i,"a",i),i},t.o=function(e,t){return Object.prototype.hasOwnProperty.call(e,t)},t.p="",t(t.s=85)}({0:function(e){e.exports=jQuery},1:function(e){e.exports={Foundation:window.Foundation}},10:function(e){e.exports={onImagesLoaded:window.Foundation.onImagesLoaded}},19:function(e,t,i){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var n=i(1),o=(i.n(n),i(49));n.Foundation.plugin(o.a,"Equalizer")},2:function(e){e.exports={Plugin:window.Foundation.Plugin}},3:function(e){e.exports={rtl:window.Foundation.rtl,GetYoDigits:window.Foundation.GetYoDigits,transitionend:window.Foundation.transitionend}},49:function(e,t,i){"use strict";function n(e,t){if(!(e instanceof t))throw new TypeError("Cannot call a class as a function")}function o(e,t){if(!e)throw new ReferenceError("this hasn't been initialised - super() hasn't been called");return!t||"object"!=typeof t&&"function"!=typeof t?e:t}function s(e,t){if("function"!=typeof t&&null!==t)throw new TypeError("Super expression must either be null or a function, not "+typeof t);e.prototype=Object.create(t&&t.prototype,{constructor:{value:e,enumerable:!1,writable:!0,configurable:!0}}),t&&(Object.setPrototypeOf?Object.setPrototypeOf(e,t):e.__proto__=t)}i.d(t,"a",function(){return f});var a=i(0),r=i.n(a),u=i(6),h=(i.n(u),i(10)),l=(i.n(h),i(3)),d=(i.n(l),i(2)),c=(i.n(d),function(){function e(e,t){for(var i=0;i<t.length;i++){var n=t[i];n.enumerable=n.enumerable||!1,n.configurable=!0,"value"in n&&(n.writable=!0),Object.defineProperty(e,n.key,n)}}return function(t,i,n){return i&&e(t.prototype,i),n&&e(t,n),t}}()),f=function(e){function t(){return n(this,t),o(this,(t.__proto__||Object.getPrototypeOf(t)).apply(this,arguments))}return s(t,e),c(t,[{key:"_setup",value:function(e,i){this.$element=e,this.options=r.a.extend({},t.defaults,this.$element.data(),i),this.className="Equalizer",this._init()}},{key:"_init",value:function(){var e=this.$element.attr("data-equalizer")||"",t=this.$element.find('[data-equalizer-watch="'+e+'"]');u.MediaQuery._init(),this.$watched=t.length?t:this.$element.find("[data-equalizer-watch]"),this.$element.attr("data-resize",e||i.i(l.GetYoDigits)(6,"eq")),this.$element.attr("data-mutate",e||i.i(l.GetYoDigits)(6,"eq")),this.hasNested=this.$element.find("[data-equalizer]").length>0,this.isNested=this.$element.parentsUntil(document.body,"[data-equalizer]").length>0,this.isOn=!1,this._bindHandler={onResizeMeBound:this._onResizeMe.bind(this),onPostEqualizedBound:this._onPostEqualized.bind(this)};var n,o=this.$element.find("img");this.options.equalizeOn?(n=this._checkMQ(),r()(window).on("changed.zf.mediaquery",this._checkMQ.bind(this))):this._events(),(n!==undefined&&!1===n||n===undefined)&&(o.length?i.i(h.onImagesLoaded)(o,this._reflow.bind(this)):this._reflow())}},{key:"_pauseEvents",value:function(){this.isOn=!1,this.$element.off({".zf.equalizer":this._bindHandler.onPostEqualizedBound,"resizeme.zf.trigger":this._bindHandler.onResizeMeBound,"mutateme.zf.trigger":this._bindHandler.onResizeMeBound})}},{key:"_onResizeMe",value:function(){this._reflow()}},{key:"_onPostEqualized",value:function(e){e.target!==this.$element[0]&&this._reflow()}},{key:"_events",value:function(){this._pauseEvents(),this.hasNested?this.$element.on("postequalized.zf.equalizer",this._bindHandler.onPostEqualizedBound):(this.$element.on("resizeme.zf.trigger",this._bindHandler.onResizeMeBound),this.$element.on("mutateme.zf.trigger",this._bindHandler.onResizeMeBound)),this.isOn=!0}},{key:"_checkMQ",value:function(){var e=!u.MediaQuery.is(this.options.equalizeOn);return e?this.isOn&&(this._pauseEvents(),this.$watched.css("height","auto")):this.isOn||this._events(),e}},{key:"_killswitch",value:function(){}},{key:"_reflow",value:function(){if(!this.options.equalizeOnStack&&this._isStacked())return this.$watched.css("height","auto"),!1;this.options.equalizeByRow?this.getHeightsByRow(this.applyHeightByRow.bind(this)):this.getHeights(this.applyHeight.bind(this))}},{key:"_isStacked",value:function(){return!this.$watched[0]||!this.$watched[1]||this.$watched[0].getBoundingClientRect().top!==this.$watched[1].getBoundingClientRect().top}},{key:"getHeights",value:function(e){for(var t=[],i=0,n=this.$watched.length;i<n;i++)this.$watched[i].style.height="auto",t.push(this.$watched[i].offsetHeight);e(t)}},{key:"getHeightsByRow",value:function(e){var t=this.$watched.length?this.$watched.first().offset().top:0,i=[],n=0;i[n]=[];for(var o=0,s=this.$watched.length;o<s;o++){this.$watched[o].style.height="auto";var a=r()(this.$watched[o]).offset().top;a!=t&&(n++,i[n]=[],t=a),i[n].push([this.$watched[o],this.$watched[o].offsetHeight])}for(var u=0,h=i.length;u<h;u++){var l=r()(i[u]).map(function(){return this[1]}).get(),d=Math.max.apply(null,l);i[u].push(d)}e(i)}},{key:"applyHeight",value:function(e){var t=Math.max.apply(null,e);this.$element.trigger("preequalized.zf.equalizer"),this.$watched.css("height",t),this.$element.trigger("postequalized.zf.equalizer")}},{key:"applyHeightByRow",value:function(e){this.$element.trigger("preequalized.zf.equalizer");for(var t=0,i=e.length;t<i;t++){var n=e[t].length,o=e[t][n-1];if(n<=2)r()(e[t][0][0]).css({height:"auto"});else{this.$element.trigger("preequalizedrow.zf.equalizer");for(var s=0,a=n-1;s<a;s++)r()(e[t][s][0]).css({height:o});this.$element.trigger("postequalizedrow.zf.equalizer")}}this.$element.trigger("postequalized.zf.equalizer")}},{key:"_destroy",value:function(){this._pauseEvents(),this.$watched.css("height","auto")}}]),t}(d.Plugin);f.defaults={equalizeOnStack:!1,equalizeByRow:!1,equalizeOn:""}},6:function(e){e.exports={MediaQuery:window.Foundation.MediaQuery}},85:function(e,t,i){e.exports=i(19)}});