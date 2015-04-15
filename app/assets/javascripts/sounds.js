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
  }

  $('#chart td span').on("click", function(evt) {
  	var glyph = $(this).attr("data-glyph")

    if (sounds[glyph]) {
      sounds[glyph].play()
    }
  })
});

