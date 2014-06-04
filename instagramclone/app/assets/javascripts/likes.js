$(document).ready(function(){
	$('.btn-like').on('click', function(event){
		console.log($(this).closest('a')[0]);
		var x = $(this).closest('.btn-like');
		//console.log(x.attr('data-method'));

		event.preventDefault();
		var button = this;
		$.post(this.href, function(result){
			// button.toggleClass('btn-like', 'btn-unlike');
			// console.log(result);
			// console.log(result.new_like_count);
			var $response=$(result);

    		//Query the jQuery object for the values
   	//	 	var oneval = $response.filter('new_like_count');
   		 	//console.log(oneval);
    		// var subval = $response.filter('#sub').text();
		});
		return false;   


	});	

	$('.btn-unlike').on('click', function(event){
		event.preventDefault();
		 var x = ($(this).closest('.btn-unlike').removeClass('btn-unlike').addClass('btn-like'));
		 console.log(x);
		  // console.log(x.attr('data-method'));
		 // console.log(x.attr('href'))
		 // console.log(x.attr('href').match(/(\/\w*\/[0-9]+\/likes)/)[0]);
				 // console.log(x);
		 // console.log($(this).closest('.btn-like'));
		
		// $.ajax({
  //   		url: this.href,
  //   		type: 'DELETE',
  //   		 success: function(result) {
  //       		console.log("Deleting Attempt");
  //   		}
		// });
		// console.log($(this).parent);

		//	<a class="btn btn-lg btn-default btn-like" href="/posts/34/likes">♥ 0</a>
		//  <a class="btn btn-lg btn-default btn-unlike" data-method="delete" href="/posts/34/likes/487" rel="nofollow">♥ 9</a>

		$.ajax({
			url: this.href,
			type: "post",
			dataType: "json",
			data: {"_method": "delete"},
			success: function(result) {
        		// console.log("Deleting Attempt");
        		// console.log(result);
        		x.removeAttr('data-method');
        		x.removeAttr('rel');
		 		x.attr('href', x.attr('href').match(/(\/\w*\/[0-9]+\/likes)/)[0] )

    		}
		});
		return false;   
	});

	var connection = new WebSocketRails('localhost:3000/websocket');
	channel = connection.subscribe('likes');
	channel.bind('new', function(post){
		var postElement = $('.post[data-id='+post.id+ '] .btn-like')
		postElement.text('♥ '+post.new_like_count);
	
		var postElement2 = $('.post[data-id='+post.id+ '] .btn-unlike')
		postElement2.text('♥ '+post.new_like_count);
	});
})