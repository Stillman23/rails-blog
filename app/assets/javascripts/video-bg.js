var tag = document.createElement('script');
tag.src = 'https://www.youtube.com/player_api';
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
var tv,
    playerDefaults = {
        autoplay: 0,
        autohide: 0,
        modestbranding: 0,
        rel: 0,
        showinfo: 0,
        controls: 0,
        disablekb: 1,
        enablejsapi: 0,
        iv_load_policy: 3
    };
var vid = [
        {'videoId': 'cusNHBJnR9c'}
    ],
    randomVid = Math.floor(Math.random() * vid.length),
    currVid = randomVid;

$('.sound em:last-of-type').html(vid.length);

function onYouTubePlayerAPIReady() {
    tv = new YT.Player('tv', {
        events: {'onReady': onPlayerReady, 'onStateChange': onPlayerStateChange},
        playerVars: playerDefaults
    });
}

function onPlayerReady() {
    tv.loadVideoById(vid[currVid]);
    tv.mute();
}

function onPlayerStateChange(e) {
    if (e.data === 1) {
        $('#tv').addClass('active');
        $('.sound em:nth-of-type(1)').html(currVid + 1);
    } else if (e.data === 2) {
        $('#tv').removeClass('active');
        if (currVid === vid.length - 1) {
            currVid = 0;
        } else {
            currVid++;
        }
        tv.loadVideoById(vid[currVid]);
        tv.seekTo(vid[currVid].startSeconds);
    }
}

function vidRescale() {

    var w = $(window).width() + 200,
        h = $(window).height() + 200;

    if (w / h > 16 / 9) {
        tv.setSize(w, w / 16 * 9);
        $('.tv .screen').css({'left': '0px'});
    } else {
        tv.setSize(h / 9 * 16, h);
        $('.tv .screen').css({'left': -($('.tv .screen').outerWidth() - w) / 2});
    }
}

$(window).on('load resize', function () {
    vidRescale();
});
//
// $('.sound   .mute-btn').on('click', function () {
//     $('#tv').toggleClass('mute');
//     $('.sound i:first-of-type').toggleClass('hidden');
//     if ($('#tv').hasClass('mute')) {
//         tv.mute();
//         $('.fa-volume-off').hide();
//         $('.fa-volume-up').show();
//         $('.toggle-text').text('TOGGLE SOUND ON');
//     } else {
//         tv.unMute();
//         $('.fa-volume-up').hide();
//         $('.fa-volume-off').show();
//         $('.toggle-text').text('TOGGLE SOUND OFF');
//     }
// });
//
// $('.sound .next-video-btn').on('click', function () {
//     $('.sound em:nth-of-type(1)').html('~');
//     tv.pauseVideo();
// });
