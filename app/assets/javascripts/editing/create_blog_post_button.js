jQuery(function(){
  scrivito.on('load', function(){

    scrivito.page_menu().add(
      "my_app.add_blog_page",
      {
        title: "create Blog Post",
        icon: "relation",
        execute: function(){
          now = new Date();
          path = now.toISOString().replace(/[^0-9]/g, '');

          scrivito.create_obj({
            _obj_class: 'BlogPost',
            _path: $('#blog').attr('data-path') + "/" + path, published_at: now
          }).done(function(data){
            window.location.href = "/" + data.id;
          });
        }
      }
    )
    var button;

    if(scrivito.in_editable_view){
      button = $('<button />').text('New blog post').css('margin-bottom', '20px').addClass('btn btn-warning');
      button.prependTo($('.blog_post'));

      button.on('click', function(){
        var now, path, prefixPath;
        $(this).attr('disabled', true);
      });
    }
  });
});
