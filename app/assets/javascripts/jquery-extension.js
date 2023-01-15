$.fn.animate = function(animation) { 
   $(this).addClass(`animate__animated animate__${animation}`)
   setTimeout(function(){
      $(this).removeClass(`animate__animated animate__${animation}`)
   }, 700)
}
