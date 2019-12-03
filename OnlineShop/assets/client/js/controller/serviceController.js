var product =
 {

     init: function () {
         product.registerEvents();
     },

     registerEvents: function () {
         $('.btnSlide').off('click').on('click', function (e) {
             e.preventDefault();
             jQuery.noConflict();
             $('#slideManage').modal();
             //$('#hidProductID').val($(this).data('id'));
             //product.loadImages();
         });
     }
 }
     

product.init();