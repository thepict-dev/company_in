const items = document.querySelectorAll('.projectLists li');
let ticking = false;

function checkScroll() {
    const triggerBottom = window.innerHeight * 0.8;

    items.forEach((item, index) => {
        const itemTop = item.getBoundingClientRect().top;

        if (itemTop < triggerBottom) {
            if (!item.classList.contains('show')) {
                setTimeout(() => {
                    item.classList.add('show');
                }, index * 50); // 딜레이를 50ms로 줄임
            }
        }
    });

    ticking = false;
}

function requestTick() {
    if (!ticking) {
        requestAnimationFrame(checkScroll);
    }
    ticking = true;
}

// 초기 체크
requestTick();

// 스크롤 이벤트에 requestTick 함수 연결
window.addEventListener('scroll', requestTick, { passive: true });

// 초기 체크
checkScroll();

// 스크롤 이벤트에 체크 함수 연결
window.addEventListener('scroll', checkScroll);

//헤더 스크롤
$(window).scroll(function() {
    if ($(this).scrollTop() > 150) {
        $('header').addClass('active');
    } else {
        $('header').removeClass('active');
    }
});

//모바일 메뉴
$(".headerInner > button").click(function () {
    $('.mbNavContainer').addClass("active");
    $('body').addClass("no-scroll");
})

$('.mbNavContainer > button').click(function () {
    $('.mbNavContainer').removeClass("active")
    $('body').removeClass("no-scroll");
})

//헤더 스크롤
$(window).scroll(function() {
    if ($(this).scrollTop() > 150) {
        $('.subContainer.pro, .subContainer.view').addClass('active');
    } else {
        $('.subContainer.pro, .subContainer.view').removeClass('active');
    }
});
