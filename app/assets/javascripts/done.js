function Done() {}

let done = new Done();

Done.prototype.change = function (element) {
  $(element).on('click', function (e) {
    let copy = Object.assign({}, $(e.target).closest('tr'));
    $(e.target).closest('tr').detach();
    if (e.target.checked) {
      $('.finish').append(copy)

    } else if (!e.target.checked) {
      $('.active').append(copy)
    }
  });
};

$(document).ready(function () {
  done.change($("input.status[type='checkbox']"));
});