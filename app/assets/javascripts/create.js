function Post() {}

let post = new Post();
Post.prototype.create = function (postId, postTitle, postPriority, postData, editURL, postsURL) {
  let tr = document.createElement('tr');
  tr.className = 'post';
  let active = document.createElement('td');
  let activeCheckbox = document.createElement('input');
  activeCheckbox.type = 'checkbox';
  $(activeCheckbox).attr('id', "done");
  $(activeCheckbox).attr('name', "done");
  $(activeCheckbox).attr('data-remote', "true");
  $(activeCheckbox).attr('data-url', `/done?id=${postId}`);
  $(activeCheckbox).attr('data-method', "get");
  activeCheckbox.className = 'input-large';
  let title = document.createElement('td');
  let priority = document.createElement('td');
  let data = document.createElement('td');
  let select = document.createElement('td');
  select.innerText = 'Select task: ';
  let selectCheckbox = document.createElement('input');
  selectCheckbox.type = 'checkbox';
  $(selectCheckbox).attr('data-url', `/completed?id=${postId}`);
  $(selectCheckbox).attr('data-remote', "true");
  $(selectCheckbox).attr('data-method', "get");
  title.innerHTML = postTitle;
  title.className = 'description'
  priority.innerHTML = postPriority;
  priority.className = 'description'
  data.innerHTML = postData;
  data.className = 'description'

  let buttons = document.createElement('td');
  let edit = document.createElement('a');
  edit.innerText = 'Edit';
  edit.className = 'btn btn-md btn btn-secondary';
  $(edit).attr('href', editURL);

  let destroy = document.createElement('a');
  destroy.innerText = 'Destroy';
  destroy.className = 'btn btn-md btn btn-danger delete_post';
  $(destroy).attr('href', `${postsURL}/${postId}`);
  $(destroy).attr('data-confirm', "Are you sure?");
  $(destroy).attr('data-remote', "true");
  $(destroy).attr('rel', "nofollow");
  $(destroy).attr('data-method', 'delete');

  $(tr).append(active);
  $(active).append(activeCheckbox);
  $(tr).append(title);
  $(tr).append(priority);
  $(tr).append(data);
  $(tr).append(select);
  $(tr).append(buttons);
  $(select).append(selectCheckbox);
  $(buttons).append(edit);
  $(buttons).append(destroy);
  $('.active').append(tr);
  done.change(activeCheckbox);
};