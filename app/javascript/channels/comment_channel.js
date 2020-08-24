import consumer from "./consumer"
window.addEventListener('load',function(){
consumer.subscriptions.create(
  {
    channel:"CommentChannel", 
    post_id: document.getElementsByClassName("comment-box")[0].getAttribute('data-post-id')
  }, {
    connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<p>${data.user.nickname}:${data.content.content}</p>`;
    const comments = document.getElementById('comments');
    const newComment = document.getElementById('comment_content');
    comments.insertAdjacentHTML('afterbegin', html);
    newComment.value='';
  }
})
});
