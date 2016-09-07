jQuery(function(){
  scrivito.on('load', function(){

    (function(scrivito, $) {
      "use strict"
      scrivito.define_editor(
        "headline_editor", {
          can_edit: function(element) {
            return true;
          },
          activate: function(element) {
            $(element).on("click", function(){
              var new_headline = prompt("New headline", $(element).text());

              $(element).scrivito("save", new_headline).done(function(){
                $(element).text(new_headline)
              });
            });
          }
        }
      );

      scrivito.select_editor(function(element, editor){
        if($(element).is("[data-scrivito-field-name=title]")){
          editor.use("headline_editor")
        }
      });

      // scrivito.content_browser.open().done(function(selected){});
      // $("[data-scrivito-field-name=title]")
    }(scrivito, jQuery));
  });
});
