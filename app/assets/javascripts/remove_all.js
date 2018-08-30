function removeAll() {
  $("input.forRemove[type='checkbox']").each(function () {
    if (this.checked) {
      let arr_tr = $(this).closest('.post')
      let post_id = arr_tr[0].id;

      $.ajax({
        url: `/posts/${post_id}`,
        type: 'DELETE',
        data: {id: post_id}
      });
      $(this).closest('.post').detach();
    }
  })
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