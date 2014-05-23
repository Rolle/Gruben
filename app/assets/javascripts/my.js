function save(layer) {
	alert(layer.latitude + ", " + layer.longitude);
	/*$.ajax({
          type: "POST",
          url: '/markers',
          data: JSON.stringify({ "marker": {"latitude": layer.latitude, "longitude": layer.longitude } }),          
          dataType: 'json',
          success: function(msg) {
            alert( "Data Saved: " + msg );
          }
	});*/
}