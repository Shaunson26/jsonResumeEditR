 function getFormData(e){

  let textObjects = $('[type="text"],[type="date"]')

  let textValues =
    textObjects
    .map(function(){
      return ({
        id:$(this).attr('id'),
        value: $(this).val()
      })
  })

  let message =
  textValues
    .get()
    .reduce(
      function(r, e){
        r[e.id] = e.value;
        return r;
        },
      {}
    )

  message = Object.assign(message, { '.nonce': Math.random() })

  Shiny.onInputChange('getFormData', message)

}
