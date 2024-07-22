$(document).ready(function () {
    var table = new DataTable("#tabla", {
        language: {
            url: '//cdn.datatables.net/plug-ins/2.0.2/i18n/es-ES.json',
            paginate: {
                first: '<i class="fas fa-angle-double-left"></i>',
                last: '<i class="fas fa-angle-double-right"></i>',
                next: '<i class="fas fa-angle-right"></i>',
                previous: '<i class="fas fa-angle-left"></i>'
            },
        },
    });
});