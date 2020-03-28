$(document).on('turbolinks:load', ()=> {
  const buildFileField = (index)=> {
    const html = `<div class="js-file_group" data-index="${index}">
                    <input class="js-file" type="file" 
                    name="item[item_imgs_attributes][${index}][src]"
                    id="item_item_imgs_attributes_${index}_src">
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;
  }
  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
    return html;
  }
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  $('#image-box').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {
      $('#previews').append(buildImg(targetIndex, blobUrl));
      $('#image-box').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    }
    if ($('.js-file').length == 5) {
      $(`.js-file_group[data-index="5"]`).remove();
    }
  });

  $('#image-box').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index');
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });

  // カテゴリーの選択欄追加
  $(function(){
    function appendCategory(){
      let subHTML = `<div class="sell-main__select-wrap">
                    <select class="sell-main__select-default" name="item[category_id]">
                      <option value="">--</option>
                    </select>
                    </div>`;
      $(categoryWrapper).append(subHTML);
    }
  
    function appendOption(category, appendWrap){
      let subOptionHTML =`<option value="${category.id}">${category.name}</option>`;
      $(appendWrap).children('select').append(subOptionHTML);
    }
  
    const categoryWrapper = '#sell-main__select-category--wrapper';
    const mainCategory = '#sell-main__select-category--main';
    const subCategory = '#sell-main__select-category--wrapper div:nth-child(2)';
    const subSubCategory = '#sell-main__select-category--wrapper div:nth-child(3)';
  
    // メインカテゴリー選択時、サブカテゴリー追加
    $(mainCategory).on('change', function(){
      let sub = $(this).val();
      let sub_sub = "0";
  
      $.ajax({
        type: "GET",
        url: '/sell/new',
        data: { sub: sub, sub_sub: sub_sub },
        dataType: 'json'
      })
  
      .done(function(categories){
        $(subSubCategory).remove();
        $(subCategory).remove();
        if(sub != ''){
          appendCategory();
          categories.forEach(function(category){
            appendOption(category, subCategory);
          });
        }
      })
      .fail(function(){
        alert('カテゴリー検索に失敗しました');
      });
    });
    
    // サブカテゴリー選択時、サブサブカテゴリー追加
    $(document).on('change', subCategory, function(){
      let sub = $(mainCategory).val();
      let sub_sub = $(this).children('select').val();
      $.ajax({
        type: "GET",
        url: '/sell/new',
        data: { sub: sub, sub_sub: sub_sub },
        dataType: 'json'
      })
  
      .done(function(categories){
        $(subSubCategory).remove();
        if(sub_sub != '' && categories[0]){
          appendCategory();
          categories.forEach(function(category){
            appendOption(category, subSubCategory);
          });
        }
      })
      .fail(function(){
        alert('カテゴリー検索に失敗しました');
      });
    });
  });
});