jQuery(function(){
  scrivito.on('load', function(){
    scrivito.register_default_obj_class_for_content_type({
      'image/*': 'Image',
      '*/*': 'MyDownload'
    });

    scrivito.content_browser.filters = function(filter_context){
      if(filter_context.blog_link) {
        return {
          _obj_class: {
            field: '_obj_class',
            options: {
              BlogPost: {
                icon: 'page'
              },
              Download: {
                icon: 'generic'
              }
            }
          }
        };
      } else {
        return {
          _obj_class: {
            field: "_obj_class",
            options: {
              Image: {
                field: 'features',
                expanded: true,
                icon: 'image',
                options: {
                  paid: {
                    // query: scrivito.obj_where('_obj_class', 'equals', 'Image').and('features', 'equals', 'paid'),
                    preset: {
                      features: ['paid']
                    }
                  },
                  free: {
                    // query: scrivito.obj_where('_obj_class', 'equals', 'Image').and('features', 'equals', 'free')
                  }
                }
              },
              Blog: {
                icon: 'page',
                enable_create: true,
                preset: {
                  _obj_class: "Blog"
                }
              },
              Download: {
                icon: 'generic'
              }
            }
          }
        }
      }
    };
  });
});
