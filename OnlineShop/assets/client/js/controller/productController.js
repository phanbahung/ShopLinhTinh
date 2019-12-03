var product =
 {

     init: function () {
        product.registerEvents();       
    },

    registerEvents: function () {
        $('.btn-images').off('click').on('click', function (e) {
            e.preventDefault();
            $('#imagesManage').modal('show');
            $('#hidProductID').val($(this).data('id'));
            product.loadImages();
        });

        $('#btnAddImage').off('click').on('click', function (e) {
            e.preventDefault();
            var url = $('input#txtUrl').val();
            if (url.trim() != "") {
                $('#imageList').append('<div style="float:left;"><img src="' + url + '" width="100" /><a href="#" class="btn-DelImage"><i class="fa fa-times"></i></a></div>');

                $('.btn-DelImage').off('click').on('click', function (e) {
                    e.preventDefault();
                    $(this).parent().remove();
                }); // btn-DelImage

                $('input#txtUrl').val('');

            } // end if


        });// btnAddImage


        $('#btnSaveImages').off('click').on('click', function () {
            var images = [];
            var id = $('#hidProductID').val();
            $.each($('#imageList img'), function (i, item) {
                images.push($(item).prop('src'));

            })
            $.ajax({

                url: '/Admin/Product/SaveImages',
                type: 'POST',
                data: {
                    id: id,
                    images: JSON.stringify(images)
                },
                dataType: 'json',
                success: function (response) {
                    if (responese.status) {
                        $('#imagesManange').modal('hide');
                        $('#imagesList').html('');
                        alert('Lưu ảnh thành công.');
                    }
                    //thong bao thanh cong
                }
            }); // end ajax
        }) // btnSaveImages
    },

    loadImages: function () {

        $.ajax({
            url: '/Admin/Product/LoadImages',
            type: 'GET',
            data: {
                id: $('#hidProductID').val()
            },

            dataType: 'json',
            success: function (response) {
                //if (response.status)
                {
                    var data = response.data;
                    var html = '';
                    $.each(data, function (i, item)
                    {
                        html += '<div style="float:left;"><img src="' + item + '" width="200" /><a href="#" class="btn-DelImage"><i class="fa fa-times"></i></a></div>'
                    });

                    $('#imageList').html(html);

                    $('.btn-DelImage').off('click').on('click', function (e) {
                        e.preventDefault();
                        $(this).parent().remove();
                    }); // btn-DelImage
                }

            }// end success

        }); // end ajax
    }// end load images
}
     

product.init();