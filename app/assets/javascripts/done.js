function Done() {}

let done = new Done();

Done.prototype.change = function (element) {
    let copy = Object.assign({}, $(element).closest('tr'));
    $(element).closest('tr').detach();
    if (element.checked) {
      $('.finish').append(copy)

    } else if (!element.checked) {
      $('.active').append(copy)
    }
};