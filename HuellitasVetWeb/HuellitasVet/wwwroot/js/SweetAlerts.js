//Eliminar Usuario
$(function () {
    $('.btn-deleteUsu').on('click', function (e) {
        e.preventDefault();
        var $this = $(this);
        var url = $this.data('url');

        Swal.fire({
            title: '¿Estás seguro?',
            text: "¡Esta acción no se puede deshacer!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#8c5cbc',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Sí, eliminar',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: '¡Eliminado!',
                    text: 'El usuario ha sido eliminado.',
                    icon: 'success',
                    confirmButtonColor: '#8c5cbc'
                }).then(() => {
                    window.location.href = url;
                });
            }
        });
    });
});

//Eliminar Mascota
$(function () {
    $('.btn-deleteMas').on('click', function (e) {
        e.preventDefault();

        var $this = $(this);
        var url = $this.data('url');

        Swal.fire({
            title: '¿Estás seguro?',
            text: "¡Esta acción no se puede deshacer!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#8c5cbc',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Sí, eliminar',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: '¡Eliminada!',
                    text: 'La mascota ha sido eliminada.',
                    icon: 'success',
                    confirmButtonColor: '#8c5cbc'
                }).then(() => {
                    window.location.href = url;
                });
            }
        });
    });
});

//Eliminar Especie
$(function () {
    $('.btn-deleteEsp').on('click', function (e) {
        e.preventDefault();

        var $this = $(this);
        var url = $this.data('url');

        Swal.fire({
            title: '¿Estás seguro?',
            text: "¡Esta acción no se puede deshacer!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#8c5cbc',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Sí, eliminar',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: '¡Eliminada!',
                    text: 'La especie ha sido eliminada.',
                    icon: 'success',
                    confirmButtonColor: '#8c5cbc'
                }).then(() => {
                    window.location.href = url;
                });
            }
        });
    });
});

// Eliminar Categoría
$(function () {
    $('.btn-deleteCat').on('click', function (e) {
        e.preventDefault();

        var $this = $(this);
        var url = $this.data('url');

        Swal.fire({
            title: '¿Estás seguro?',
            text: "¡Esta acción no se puede deshacer!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#8c5cbc',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Sí, eliminar',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: '¡Eliminada!',
                    text: 'La categoría ha sido eliminada.',
                    icon: 'success',
                    confirmButtonColor: '#8c5cbc'
                }).then(() => {
                    window.location.href = url;
                });
            }
        });
    });
});


// Eliminar Rol
$(function () {
    $('.btn-deleteRol').on('click', function (e) {
        e.preventDefault();

        var $this = $(this);
        var url = $this.data('url');

        Swal.fire({
            title: '¿Estás seguro?',
            text: "¡Esta acción no se puede deshacer!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#8c5cbc',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Sí, eliminar',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: '¡Eliminado!',
                    text: 'El rol ha sido eliminado.',
                    icon: 'success',
                    confirmButtonColor: '#8c5cbc'
                }).then(() => {
                    window.location.href = url;
                });
            }
        });
    });
});

// Eliminar Servicios
$(function () {
    $('.btn-deleteServ').on('click', function (e) {
        e.preventDefault();

        var $this = $(this);
        var url = $this.data('url');

        Swal.fire({
            title: '¿Estás seguro?',
            text: "¡No podrás revertir esta acción!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#8c5cbc',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Sí, eliminar',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: '¡Eliminado!',
                    text: 'El servicio ha sido eliminado.',
                    icon: 'success',
                    confirmButtonColor: '#8c5cbc'
                }).then(() => {
                    window.location.href = url;
                });
            }
        });
    });
});

//Eliminar Productos
$(function () {
    $('.btn-deletePro').on('click', function (e) {
        e.preventDefault();
        var $this = $(this);
        var url = $this.data('url');

        Swal.fire({
            title: '¿Estás seguro?',
            text: "¡Esta acción no se puede deshacer!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#8c5cbc',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Sí, eliminar',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: '¡Eliminado!',
                    text: 'El producto ha sido eliminado.',
                    icon: 'success',
                    confirmButtonColor: '#8c5cbc'
                }).then(() => {
                    window.location.href = url;
                });
            }
        });
    });
});