module MapsHelper
	def popup(img)
		return '<h5>'+ img.adit.name + '</h5>'+ 
			  link_to(image_tag(img.image.url(:thumb)), img)  +
			'<p>' + link_to('<i class="btn btn-primary btn-sm glyphicon glyphicon-edit"></i>'.html_safe, edit_image_artifact_path(img)) +
	    			link_to('<i class="btn btn-primary btn-sm glyphicon glyphicon-globe"></i>'.html_safe, image_artifact_map_path(img)) +
	    			link_to('<i class="btn btn-primary btn-sm glyphicon glyphicon-picture"></i>'.html_safe, image_artifact_path(img)) +
	    			link_to('<i class="btn btn-danger btn-sm glyphicon glyphicon-remove"></i>'.html_safe, image_artifact_path(img), method: :delete, remote: :true, data: { confirm: 'Hiermit werden die Daten als auch die Bild-Dateien gelöscht. Wirklich wirklich sicher löschen? '}) +
	    	'</p>' +					
			'<p>'+
				check_box_tag('ck_main_'+img.id.to_s, img.id, img.main, :data => {:remote=> true, :url => url_for(action: :main, controller: :image_artifacts, id: img.id), id: img.id}) + 'Grube/Stollen' + '<br/>' +
				check_box_tag('ck_primary_'+img.id.to_s, img.id, img.primary, :data => {:remote=> true, :url => url_for(action: :primary, controller: :image_artifacts, id: img.id), id: img.id}) + 'Primär' + '<br/>' +
				check_box_tag('ck_flag_'+img.id.to_s, img.id, img.flag, :data => {:remote=> true, :url => url_for(action: :flag, controller: :image_artifacts, id: img.id), id: img.id}) + 'Mundloch' +
			'</p>'
	end
end
