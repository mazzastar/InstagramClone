$(document).ready(function(){
	$('body').on('click', '.btn-like', function(event){
		event.preventDefault();
		$.post(this.href);
		console.log(this.href);
		$(this).removeClass('btn-like').addClass('btn-unlike');
	});

	$('body').on('click', '.btn-unlike', function(event){
		event.preventDefault();
		$.ajax({url: this.href + '/1', type: 'delete'});
		$(this).removeClass('btn-unlike').addClass('btn-like');
	});


	var connection = new WebSocketRails(window.location.host + '/websocket');
	channel = connection.subscribe('likes');
	channel.bind('new', function(post){
		var postElement = $('.post[data-id='+post.id+ '] .btn-like')
		postElement.text('♥ '+post.new_like_count);
	
		var postElement2 = $('.post[data-id='+post.id+ '] .btn-unlike')
		postElement2.text('♥ '+post.new_like_count);
	});
})