$(document).ready(function(){
	$('body').on('click', '.btn-like', function(event){
		event.preventDefault();
		$.post(this.href);
		console.log(this.href);
		$(this).removeClass('btn-like').addClass('btn-unlike');
	});

	$('body').on('click', '.btn-unlike', function(event){
		event.preventDefault();
		$.ajax({url: this.href, type: 'delete'});
		$(this).removeClass('btn-unlike').addClass('btn-like');
	});

	var connection = new WebSocketRails(window.location.host+'/websocket');
	channel = connection.subscribe('likes');

	channel.bind('new', function(post){
		var postElem = $('.post[data-id='+post.id+'] .btn-unlike');
		postElem.text('♥ '+post.new_like_count);
	});

	channel.bind('destroy', function(post){
		var postElem = $('.post[data-id='+post.id+'] .btn-like');
		postElem.text('♥ '+post.new_like_count);
	});

})


// $(document).ready(function(){
// 	$('.btn-like').on('click', function(event){
// 		console.log($(this).closest('a')[0]);
// 		var x = $(this).closest('.btn-like');
// 		event.preventDefault();
// 		var button = this;
// 		$.post(this.href, function(result){			
// 			var $response=$(result);
// 		});
// 		return false;   


// 	});	

// 	$('.btn-unlike').on('click', function(event){
// 		event.preventDefault();
// 		 var x = ($(this).closest('.btn-unlike').removeClass('btn-unlike').addClass('btn-like'));
// 		$.ajax({
// 			url: this.href,
// 			type: "post",
// 			dataType: "json",
// 			data: {"_method": "delete"},
// 			success: function(result) {
//         		// console.log("Deleting Attempt");
//         		// console.log(result);
//         		x.removeAttr('data-method');
//         		x.removeAttr('rel');
// 		 		x.attr('href', x.attr('href').match(/(\/\w*\/[0-9]+\/likes)/)[0] )

//     		}
// 		});
// 		return false;   
// 	});

// 	var connection = new WebSocketRails(window.location.host + '/websocket');
// 	channel = connection.subscribe('likes');
// 	channel.bind('new', function(post){
// 		var postElement = $('.post[data-id='+post.id+ '] .btn-like')
// 		postElement.text('♥ '+post.new_like_count);
	
// 		// var postElement2 = $('.post[data-id='+post.id+ '] .btn-unlike')
// 		postElement2.text('♥ '+post.new_like_count);
// 	});
// })