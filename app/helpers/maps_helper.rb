module MapsHelper
	def popup(img)
		return '<h5>'+img.adit.name + '</h5>' + link_to(image_tag(img.image.url(:thumb)), img) + link_to("Bearbeiten", edit_image_artifact_path(img), :class=>"btn btn-small") +
		check_box_tag('ck_main_'+img.id.to_s, img.id, img.main, :data => {:remote=> true, :url => url_for(action: :main, controller: :image_artifacts, id: img.id), id: img.id}) +'Grube/Stollen' +
		check_box_tag('ck'+img.id.to_s, img.id, img.flag,	    :data => {:remote=> true, :url => url_for(action: :flag, controller: :image_artifacts, id: img.id), id: img.id}) + 'Kein Mundloch'		
	end
end
