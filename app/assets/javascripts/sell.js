$(document).on('turbolinks:load', ()=> {
  const buildFileField = (index)=> {
    const html = `<div class="image-file_group" data-index="${index}">
                    <input class="image-file" type="file" 
                    name="item[item_imgs_attributes][${index}][img]"
                    id="item_item_imgs_attributes_${index}_img">
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;
  }
  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
    return html;
  }
  const buildFileField2 = (index)=> {
    const html = `<div class="js-input">
                    <div class="image-file_group" data-index="${index}">
                      <input class="image-file" type="file" 
                      name="item[item_imgs_attributes][${index}][img]"
                      id="item_item_imgs_attributes_${index}_img">
                      <div class="js-remove">削除</div>
                    </div>
                  </div>`;
    return html;
  }

  let fileIndex = [1,2,3,4,5];

  $('.dropbox-container').on('change', '.image-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {
      $('#previews').append(buildImg(targetIndex, blobUrl));
      $('.js-input').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    }
    if($('.image-file_group').length > 5) {
      $(`.image-file_group[data-index="5"]`).remove();
    }
  });

  $('.dropbox-container').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index');
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);

    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();

    if ($('.image-file').length == 0) $('.dropbox-container').append(buildFileField2(fileIndex[0]));
  });
});