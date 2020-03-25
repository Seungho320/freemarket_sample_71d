$(document).on("turbolinks:load", function() {
  // ヘッダー「カテゴリーから探す」プルダウン 第一階層
    $(".toppage-header-top__footer-search-wrapper").hover(function () {
      $(".first-category__wrapper").show()
      }, function () {
      $(".first-category__wrapper").hide()
    });
 
    // 各カテゴリーとクラスの紐付け
    const firstCategory = 'li.first-category';
    const secondCategory = 'li.second-category';
    const thirdCategory = 'li.third-category';
  
    // 第二階層カテゴリー表示テンプレ
    function showSubCategory(data, dataSecond){
      let showSub = `<li class="second-category" data-category-id="" data-category-sub="${data.id}" data-category-sub-sub="${data.sub}">
                  <div>
                  ${data.name}
                   </div>
                   <ul class="third-category__wrapper">
                   <li class="third-category" data-category-id="" data-category-sub="" data-category-sub_sub="">
                   ${data.name}
                   </li>`;
                    $("ul.second-category__wrapper").append(showSub);
    }
  
    // 第二階層マウスオーバー表示
    $("li.first-category").hover(function () {
  
      let firstId = $(this).last().attr('data-category-id');
      let secondId = $(this).last().attr('data-category-sub');
      let thirdId = $(this).last().attr('data-category-sub-sub');
      let data = {id: firstId,
                  sub: secondId,
                  sub_sub: thirdId };

      $.ajax({
        url: '/sell',
        type: 'GET',
        data: data,
        dataType: 'json',
      })
  
        .done(function(categories){
          $(secondCategory).remove();
          $(thirdCategory).remove();
          $(".second-category__wrapper").show()
          , function () {
          $(".second-category__wrapper").hide()
          };
          categories.forEach(function(data){
          showSubCategory(data);
          })
        .fail(function(){
          alert('カテゴリーがありません');
        });
      });
    });
  });