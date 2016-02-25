$(function(){

	$('#slide-submenu').on('click',function() {			        
        $(this).closest('.image-info-group').fadeOut('slide',function(){
        	$('.mini-submenu').fadeIn();	
        });
        
      });

	$('.mini-submenu').on('click',function(){		
        $(this).next('.image-info-group').toggle('slide');
        $('.mini-submenu').hide();
	})
})
