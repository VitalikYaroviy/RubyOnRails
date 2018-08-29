$(document).ready(function () {
  $("input.status[type='checkbox']").on('click', function (e) {
    let copy = Object.assign({}, $(e.target).closest('tr'));
    $(e.target).closest('tr').detach()
    if (e.target.checked) {
      $('.finish').append(copy)

    } else if (!e.target.checked) {
      $('.active').append(copy)
    }
  });
});