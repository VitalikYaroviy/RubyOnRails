function removeAll() {
  let arrIds = [];
  let elements = [];
  $("input.forRemove[type='checkbox']:checked").each(function () {
    let post = $(this).closest('tr.post');
    let postId = post[0].id;
    arrIds.push(postId);
    elements.push(post)
  });

  $.ajax({
    url: '/destroy_multiple',
    type: 'DELETE',
    data: {ids: arrIds}
  }).then(function () {
    $(elements).remove();
  });
}

function selectAll() {
  $("input.forRemove[type='checkbox']").each(function () {
    $(this).prop("checked", true)
  })
}

function uncheckAll() {
  $("input.forRemove[type='checkbox']").each(function () {
    $(this).prop("checked", false)
  })
}