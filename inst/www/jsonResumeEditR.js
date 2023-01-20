  /**
 * Return element ID to shiny input 'themePreview'
 *
 * Used to trigger template previews
 *
 * @return A Shiny input 'themePreview' with a named list
 */
 function returnThemeName(element){

   message = {
     id: element.id
   };

  Shiny.onInputChange('themePreview', message);
 }

 /**
 * Extract values from inputs on page
 *
 * This function obtains the values and name attributes from text and date inputs
 * on the page. It excludes placeholder inputs.
 *
 * @return A Shiny input 'getFormData' with a named list
 */
 function getFormData(){

  let textObjects = $('[type="text"],textarea, [type="date"]').not(':first')
  let exclusion_pattern = 'row-count-placeholder'

  let textValues =
    textObjects
      .map(function(){
        let is_placeholder = $(this).attr('id').includes(exclusion_pattern)
        if (!is_placeholder){
          let res = {
            id: $(this).attr('id'),
            value: $(this).val()
          };
          return res;
        }
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

 /**
 * Change arrow on collapse click
 *
 * @return Nothing
 */

$(document).ready(function () {
  $('.btn-collapse').click(function () {
    let text = $(this).html();
    if (text.includes('▼')) {
      $(this).html(text.replace('▼', '►'));
    } else {
      $(this).html(text.replace('►', '▼'));
    }
  });
});


 /**
 * Click all collapsable elements to hide them
 *
 * @return Nothing
 */
function collapseAllBtns(){
  $('.btn-collapse').each(function(){
    let text = $(this).html();
    if (text.includes('▼')) {
      $(this).click();
    };
  })
}
