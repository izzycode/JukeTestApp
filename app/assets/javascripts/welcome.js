// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

(function() {
				var pageWrap = document.getElementById( 'pagewrap' ),
					pages = [].slice.call( pageWrap.querySelectorAll( 'div.container' ) ),
					currentPage = 0,
					triggerLoading = [].slice.call( pageWrap.querySelectorAll( 'a.pageload-link' ) ),
					loader = new SVGLoader( document.getElementById( 'loader' ), { speedIn : 300, easingIn : mina.easeinout } );

				function init() {
					triggerLoading.forEach( function( trigger ) {
						trigger.addEventListener( 'click', function( ev ) {
							ev.preventDefault();
							loader.show();
							// after some time hide loader
							setTimeout( function() {
								loader.hide();

								classie.removeClass( pages[ currentPage ], 'show' );
								// update..
								currentPage = currentPage ? 0 : 1;
								classie.addClass( pages[ currentPage ], 'show' );

							}, 2000 );
						} );
					} );
				}

				init();
			})();
		
