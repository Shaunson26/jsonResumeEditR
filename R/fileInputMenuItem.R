fileInputMenuItem <-
  function (inputId, label, multiple = FALSE, accept = NULL, width = NULL,
            placeholder = "No file selected",
            capture = NULL)
  {
    # from github, not exported in shiny
    shinyInputLabel <- function(inputId, label = NULL) {
      # AdminLTE .sidebar-menu > li > a { padding: 12px 5px 12px 15px; }
      tags$label(
        # custom styling
        style = 'font-weight: normal; width: 100%; cursor:pointer;margin-bottom: 0;',
        class = "control-label",
        class = if (is.null(label)) "shiny-label-null",
        # `id` attribute is required for `aria-labelledby` used by screen readers:
        id = paste0(inputId, "-label"),
        `for` = inputId,
        tags$i(class = "fa-solid fa-file-import"),
        label,
      )
    }
    restoredValue <- restoreInput(id = inputId, default = NULL)
    if (!is.null(restoredValue) && !is.data.frame(restoredValue)) {
      warning("Restored value for ", inputId, " has incorrect format.")
      restoredValue <- NULL
    }
    if (!is.null(restoredValue)) {
      restoredValue <- jsonlite::toJSON(restoredValue, strict_atomic = FALSE)
    }
    inputTag <- tags$input(id = inputId, name = inputId, type = "file",
                           style = "position: absolute !important; top: -99999px !important; left: -99999px !important;",
                           `data-restore` = restoredValue,
                           onchange = sprintf("$('#%s-fileInfo').fadeIn();$('a[href=\"#shiny-tab-basics\"]').click()", inputId))
    if (multiple)
      inputTag$attribs$multiple <- "multiple"
    if (length(accept) > 0)
      inputTag$attribs$accept <- paste(accept, collapse = ",")
    if (!is.null(capture)) {
      inputTag$attribs$capture <- capture
    }
    tagList(
      tags$li(
        a(
          style = 'padding: 0;',
          class = "",
          style = htmltools::css(width = validateCssUnit(width)),
          shinyInputLabel(inputId, label)
        )
      ),
      div(id = paste0(inputId, "-fileInfo"),
          style = 'display: none;',
        div(
          # match left-right of AdminLTE .sidebar-menu > li > a
          style = 'width: 100%; padding: 0px 5px 0px 15px;',
          class = "input-group",
          inputTag,
          tags$input(
            type = "text",
            class = "form-control",
            placeholder = placeholder,
            readonly = "readonly"
          )
        ),
        tags$div(
          # match left-right of AdminLTE .sidebar-menu > li > a
          style = 'margin-bottom: 0; margin-top: 2px; background-color: transparent; padding: 0px 5px 0px 15px;',
          id = paste(inputId, "_progress", sep = ""),
          class = "progress active shiny-file-input-progress",
          tags$div(class = "progress-bar")
        )
      )
    )

  }
