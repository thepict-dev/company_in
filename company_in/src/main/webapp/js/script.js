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

//로딩화면
const loadingScreen = document.getElementById('loadingScreen');
const paths = document.querySelectorAll('.loading path');

paths.forEach(path => {
    const length = path.getTotalLength();
    path.style.strokeDasharray = length;
    path.style.strokeDashoffset = length;
});

let start;
function step(timestamp) {
    if (start === undefined) start = timestamp;
    const elapsed = timestamp - start;
    
    paths.forEach(path => {
        const length = path.getTotalLength();
        const progress = Math.min(elapsed / 2000, 1);
        const drawLength = length * progress;
        path.style.strokeDashoffset = length - drawLength;
        if (progress === 1) {
            path.style.fill = '#3E3A39';
        }
    });

    if (elapsed < 2000) {
        window.requestAnimationFrame(step);
    } else {
        // 애니메이션이 끝나면 로딩 화면을 천천히 사라지게 함
        loadingScreen.style.transition = 'opacity 0.5s ease-out';
        loadingScreen.style.opacity = '0';
        setTimeout(() => {
            loadingScreen.style.display = 'none';
        }, 500);
    }
}

window.requestAnimationFrame(step);

// 페이지 로드가 완료되면 로딩 화면을 숨김
window.addEventListener('load', function() {
    setTimeout(() => {
        loadingScreen.style.display = 'none';
    }, 2500); // 애니메이션 시간(2초) + 약간의 여유 시간
});