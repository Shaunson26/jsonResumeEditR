function clearFormData(e){

  let textObjects = $('[type="text"],[type="date"]')

  //sd = $(this).attr('placeholder');
  let textValues =
   textObjects.each(function(){
     $(this).val('')
   })

   // Delete inputs

}
