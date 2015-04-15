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
  }

  $('#vowelQuadrilateral span').on("click", function(evt) {
    var glyph = $(this).attr("data-glyph")

    if (sounds[glyph]) {
      sounds[glyph].play()
    }
  })
});