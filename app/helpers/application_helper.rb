module ApplicationHelper
  def heading_builder(page_id)
    content = ""    
    content << "Karte" if (page_id.start_with? "map_")
    content << "Upload" if (page_id.start_with? "upload_")
    content << "Bilder" if (page_id.start_with? "image")
    content_tag("h1", content,{}, false)
  end

  def menu_builder(page_id)
    content = ""
    if current_user
      if page_id.start_with? "map_"
        content << '<li class="active"><a href='+maps_path+'><i class="icon-map-marker"></i> Karte</a></li>'
      else
        content << '<li><a href='+maps_path+'><i class="icon-map-marker"></i> Karte</a></li>'
      end
      if page_id.start_with? "adit_"
        content << '<li class="active"><a href='+adits_path+'><i class="icon-th-list"></i> Stollen</a></li>'
      else
        content << '<li><a href='+adits_path+'><i class="icon-th-list"></i> Stollen</a></li>'
      end        
      if page_id.start_with? "image_upload"
        content << '<li class="active"><a href='+new_image_artifact_path+'><i class="icon-camera"></i> Upload</a></li>'
      else
        content << '<li><a href='+new_image_artifact_path+'><i class="icon-camera"></i> Upload</a></li>'
      end
      if page_id == "image_index"
        content << '<li class="active"><a href='+image_artifacts_path+'><i class="icon-picture"></i> Galerie</a></li>'
      else
        content << '<li><a href='+image_artifacts_path+'><i class="icon-picture"></i> Galerie</a></li>'
      end
      if page_id.start_with? "note_"
        content << '<li class="active"><a href='+edit_note_path(1)+'><i class="icon-list-alt"></i> Notiz</a></li>'
      else
        content << '<li><a href='+edit_note_path(1)+'><i class="icon-list-alt"></i> Notiz</a></li>'
      end
      if page_id.start_with? "place_"
        content << '<li class="active"><a href='+places_path+'><i class="icon-list-alt"></i> Orte</a></li>'
      else
        content << '<li><a href='+places_path+'><i class="icon-list-alt"></i> Orte</a></li>'
      end        
    end
    if current_user
      content << '<li><a href="/logout"><i class="icon-file"></i> Logout</a></li>'
    else
      content << '<li><a href="/login"><i class="icon-file"></i> Login</a></li>'
    end    
    content_tag(:ul, content, {:class=>'nav navbar-nav'}, false)
  end
end