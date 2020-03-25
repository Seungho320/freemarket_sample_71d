$(document).on('turbolinks:load', ()=> {
  // 画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `<div class="image-file_group" data-index="${index}">
                    <input class="image-file" type="file" 
                    name="item[item_imgs_attributes][${index}][img]"
                    id="item_item_imgs_attributes_${index}_img">
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  $('.dropbox-container').on('change', '.image-file', function(e) {
    // fileIndexの先頭の数字を使ってinputを作る
    $('.dropbox-container').append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    // 末尾の数に1足した数を追加する
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });

  $('.dropbox-container').on('click', '.js-remove', function() {
    $(this).parent().remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.image-file').length == 0) $('.dropbox-container').append(buildFileField(fileIndex[0]));
  });
});