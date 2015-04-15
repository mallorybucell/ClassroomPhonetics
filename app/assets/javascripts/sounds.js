// Pulmonic Consonants

function playSoundForGlyph (glyph) {
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
    "p": new Howl({
      urls: ['/ipa-sounds/U+0070.mp3']
    }),
    "b": new Howl({
      urls: ['/ipa-sounds/U+0062.mp3']
    }),
    "t": new Howl({
      urls: ['/ipa-sounds/U+0074.mp3']
    }),
    "d": new Howl({
      urls: ['/ipa-sounds/U+0064.mp3']
    }),
    // --
    "ʈ": new Howl({
      urls: ['/ipa-sounds/VL_retroflex_plosive.mp3']
    }),
    "ɖ": new Howl({
      urls: ['/ipa-sounds/V_retroflex_plosive.mp3']
    }),
    "c": new Howl({
      urls: ['/ipa-sounds/VL_palatal_plosive.mp3']
    }),
    "ɟ": new Howl({
      urls: ['/ipa-sounds/V_palatal_plosive.mp3']
    }),
    "k": new Howl({
      urls: ['/ipa-sounds/VL_velar_plosive.mp3']
    }),
    "g": new Howl({
      urls: ['/ipa-sounds/V_velar_plosive.mp3']
    }),
    "q": new Howl({
      urls: ['/ipa-sounds/VL_uvular_plosive.mp3']
    }),
    "ɢ": new Howl({
      urls: ['/ipa-sounds/V_uvular_plosive.mp3']
    }),
    "ʔ": new Howl({
      urls: ['/ipa-sounds/VL_glottal_plosive.mp3']
    }),
    "i": new Howl({
      urls: ['/ipa-sounds/close_front_unrounded.mp3']
    }),
  }

  $('#chart td span').on("click", function(evt) {
  	var glyph = $(this).attr("data-glyph")

    if (sounds[glyph]) {
      sounds[glyph].play()
    }
  })
});

