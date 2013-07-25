module MapsHelper
	def popup(img)
		return '<p><h5>'+ img.adit.name + '</h5></p>'+ 
			'<p>'+link_to(image_tag(img.image.url(:thumb)), img) + '</p>' +
			'<p>'+link_to("Bearbeiten", edit_image_artifact_path(img), :class=>"btn btn-small") + '</p>' +					
			'<p>'+check_box_tag('ck_main_'+img.id.to_s, img.id, img.main, :data => {:remote=> true, :url => url_for(action: :main, controller: :image_artifacts, id: img.id), id: img.id}) + 'Grube/Stollen' + '</p>' +
			'<p>'+check_box_tag('ck_adit_'+img.id.to_s, img.id, img.main, :data => {:remote=> true, :url => url_for(action: :adit, controller: :image_artifacts, id: img.id), id: img.id}) + 'Primär' + '</p>' +
			'<p>'+check_box_tag('ck_flag_'+img.id.to_s, img.id, img.flag, :data => {:remote=> true, :url => url_for(action: :flag, controller: :image_artifacts, id: img.id), id: img.id}) + 'Mundloch' + '</p>' 
	end
end
