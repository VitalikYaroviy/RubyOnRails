function Post() {}

let post = new Post();
Post.prototype.hangUpEvent = function (postId) {
  done.change($( "#" + postId).find('.status'));
};