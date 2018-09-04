function Post() {}

let post = new Post();
Post.prototype.create = function (postId) {
  done.change($( "#" + postId).find('.status'));
};