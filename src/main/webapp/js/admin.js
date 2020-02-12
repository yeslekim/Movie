
/* :: gnb s :: */
(function($) {
    $(document).ready(function() {
        var $gnb_btn = $('.gnb_list > li > a'),
            $dep2 = $('.gnb_dep2');

        $gnb_btn.on('mouseenter', function() {
            var $this = $(this),
                $this_dep2 = $this.siblings('.gnb_dep2');

            $this.parent().siblings().removeClass('active');
            $this.parent().addClass('active');
            $dep2.removeClass('active');
            $this_dep2.addClass('active');
        });

        $gnb_btn.parent().on('mouseleave', function() {
            var $this = $(this);

            $this.removeClass('active');
            $dep2.removeClass('active');
        });

    });
})(jQuery);
/* :: gnb e :: */


/* :: tab s :: */
(function($) {
    $(document).ready(function() {
        var $tab = $('.js_tab'),
            $tab_btn = $('.js_tab_btn'),
            $tab_content = $('.js_tab_content');

        $tab_btn.parent().each(function(i,e) {
            var $this = $(this),
                $this_idx = $this.index();
            if($this_idx == 0) $(this).addClass('active');
        });

        $tab.find($tab_content).each(function(i,e) {
            var $this = $(this),
                $this_idx = $this.index();
            if($this_idx == 0) $(this).addClass('active');
        });

        $tab_btn.on('click', function() {
            var $this = $(this),
                $this_data = $this.data('tab');

            $tab_btn.parent().removeClass('active');
            $this.parent().addClass('active');
            $tab.find($tab_content).removeClass('active');
            $tab.find('div[data-tab="'+ $this_data +'"]').addClass('active');
        });
    });
})(jQuery);
/* :: tab e :: */



/* :: popup s :: */
function popupOpen(layer) {
    $('.js_modal_popup').removeClass('active').hide();
    $(layer).addClass('active').show();
    $('body').css('overflow', 'hidden');
}

function popupClose(layer) {
    $(layer).removeClass('active').hide();
    $('body').css('overflow', 'auto');
}
/* :: popup e :: */




/* :: calendar s :: */
(function($){
    $(function(){
        var $datepicker = $('.js_datepicker');
        if(!$datepicker.length) return;
        var today = new Date(),
            yy = today.getFullYear(),
            mm = today.getMonth()+1,
            dd = today.getDate();

        $datepicker.datepicker({
            setDate:'today',
            inline: true,
            showOtherMonths: true,
            dateFormat: 'yy-mm-dd',
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            showOn: "focus"
            /*minDate: yy+"-"+mm+"-"+dd*/
        });
    });
})(jQuery);
/* :: calendar e :: */



/* :; accordion s :: */
(function($) {
    $(document).ready(function() {
        var $accordion = $('.js_accordion'),
            $item = $('.js_accordion_item'),
            $btn = $('.js_accordion_btn'),
            $content = $('.js_accordion_content');

        $btn.on('click', function() {
            var $this = $(this),
                $this_item = $this.closest($item),
                $this_content = $this_item.find($content);

            $this_item.siblings($item).find($btn).removeClass('active');
            $this.toggleClass('active');
            $this_item.siblings($item).find($content).slideUp().removeClass('active');
            $this_content.slideToggle().toggleClass('active');
        });
    });
})(jQuery);
/* :; accordion e :: */


/* :: print s :: */
function printFunc(obj) {
    var $body = $('body'),
        $wrapper = $('.wrapper'),
        print_div = $('<div class="print_div"></div>');

    $body.append(print_div);
    $(obj).clone().appendTo(print_div);
    $wrapper.hide();
    window.print();
    $wrapper.show();
    print_div.remove();
}
/* :: print e :: */