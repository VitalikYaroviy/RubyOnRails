$(document).ready(function () {
    $("input[type='checkbox']").on('click', function (e) {
        let copy = Object.assign({}, $(e.target).closest('tr'));
        $(e.target).closest('tr').detach()
        if (e.target.checked) {
            $('.finish').append(copy)
            $(copy[0]).removeClass('false')
            $(copy[0]).addClass('true')


        } else if (!e.target.checked) {
            $('.active').append(copy)
            $(copy[0]).removeClass('true')
        }
    });
})