function playSoundForVowel (glyph) {
  return;
}

function enableSound (element) {
  $(node).onclick(function () {
    var glyph = this.glyph;

    playSoundForGlyph(glyph);
  });
}

$(function () {
  var sounds = {
    "i": new Howl({
      urls: ['/ipa-sounds/close_front_unrounded.mp3']
    }),
    "y": new Howl({
      urls: ['/ipa-sounds/close_front_rounded.mp3']
    }),

    "ɨ": new Howl({
      urls: ['/ipa-sounds/close_central_unrounded.mp3']
    }),

    "ʉ": new Howl({
      urls: ['/ipa-sounds/close_central_rounded.mp3']
    }),

    "ɯ": new Howl({
      urls: ['/ipa-sounds/close_back_unrounded.mp3']
    }),

    "u": new Howl({
      urls: ['/ipa-sounds/close_back_rounded.mp3']
    }),

    "ɪ": new Howl({
      urls: ['/ipa-sounds/near-close_near-front_unrounded.mp3']
    }),

    "ʏ": new Howl({
      urls: ['/ipa-sounds/near-close_near-front_rounded.mp3']
    }),

    "ʊ": new Howl({
      urls: ['/ipa-sounds/near-close_near-back_rounded.mp3']
    }),

    "e": new Howl({
      urls: ['/ipa-sounds/close-mid_front_unrounded.mp3']
    }),

    "ø": new Howl({
      urls: ['/ipa-sounds/close-mid_front_rounded.mp3']
    }),

    "ɘ": new Howl({
      urls: ['/ipa-sounds/close-mid_central_unrounded.mp3']
    }),

    "ɵ": new Howl({
      urls: ['/ipa-sounds/close-mid_central_rounded.mp3']
    }),

    "ø": new Howl({
      urls: ['/ipa-sounds/close_front_unrounded.mp3']
    }),

    "ɤ": new Howl({
      urls: ['/ipa-sounds/close-mid_back_unrounded.mp3']
    }),

    "o": new Howl({
      urls: ['/ipa-sounds/close-mid_back_rounded.mp3']
    }),

    "ə": new Howl({
      urls: ['/ipa-sounds/mid-central.mp3']
    }),

    "ɛ": new Howl({
      urls: ['/ipa-sounds/open-mid_front_unrounded']
    }),

    "œ": new Howl({
      urls: ['/ipa-sounds/open-mid_front_rounded.mp3']
    }),

    "ɜ": new Howl({
      urls: ['/ipa-sounds/open-mid_front_unrounded.mp3']
    }),

    "ɞ": new Howl({
      urls: ['/ipa-sounds/open-mid_front_rounded.mp3']
    }),

    "ʌ": new Howl({
      urls: ['/ipa-sounds/open-mid_back_unrounded.mp3']
    }),

    'ɔ': new Howl({
      urls: ['/ipa-sounds/open-mid_back_rounded.mp3']
    }),

    "æ": new Howl({
      urls: ['/ipa-sounds/near-open_front_unrounded.mp3']
    }),

    "ɐ": new Howl({
      urls: ['/ipa-sounds/near-open_central.mp3']
    }),

    "a": new Howl({
      urls: ['/ipa-sounds/open_front_unrounded.mp3']
    }),

    "ɶ": new Howl({
      urls: ['/ipa-sounds/open_front_rounded.mp3']
    }),

    "ɑ": new Howl({
      urls: ['/ipa-sounds/open_back_unrounded.mp3']
    }),

    "ɒ": new Howl({
      urls: ['/ipa-sounds/open_back_rounded.mp3']
    }),
  }

  $('#vowelQuadrilateral span').on("click", function(evt) {
    var glyph = $(this).attr("data-glyph")

    if (sounds[glyph]) {
      sounds[glyph].play()
    }
  })
});