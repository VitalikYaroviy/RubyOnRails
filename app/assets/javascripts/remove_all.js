function removeAll() {
  let arr_ids = [];
  $("input.forRemove[type='checkbox']").each(function () {
    if (this.checked) {
      let post = $(this).closest('.post');
      let post_id = post[0].id;
      arr_ids.push(post_id);
      $(this).closest('.post').detach();
    }
  });

  $.ajax({
    url: '/destroy_multiple',
    type: 'DELETE',
    data: { ids: arr_ids }
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