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
//     // start here sound map
    "m": new Howl({
      urls: ['/ipa-sounds/V_bilabial_nasal.mp3']
    }),

    "ɱ": new Howl({
      urls: ['/ipa-sounds/V_labiodental_nasal.mp3']
    }),
    "n": new Howl({
      urls: ['/ipa-sounds/V_alveolar_nasal.mp3']
    }),
    "ɳ": new Howl({
      urls: ['/ipa-sounds/V_retroflex_nasal.mp3']
    }),
    
    "ɲ": new Howl({
      urls: ['/ipa-sounds/V_palatal_nasal.mp3']
    }),
    
    "ŋ": new Howl({
      urls: ['/ipa-sounds/V_velar_nasal.mp3']
    }),
    
    "ɴ": new Howl({
      urls: ['/ipa-sounds/V_uvular_nasal.mp3']
    }),


    "ʙ": new Howl({
      urls: ['/ipa-sounds/V_bilabial_trill.mp3']
    }),

    "r": new Howl({
      urls: ['/ipa-sounds/V_alveolar_trill.mp3']
    }),

    "ʀ": new Howl({
      urls: ['/ipa-sounds/V_uvular_trill.mp3']
    }),

    "&#x2C71;": new Howl({
      urls: ['/ipa-sounds/V_labialdental_flap.mp3']
    }),

    "ɾ": new Howl({
      urls: ['/ipa-sounds/V_alveolar_tap.mp3']
    }),

    "ɽ": new Howl({
      urls: ['/ipa-sounds/V_retroflex_tap.mp3']
    }),

    "ɸ": new Howl({
      urls: ['/ipa-sounds/VL_bilabial_fricative.mp3']
    }),

    "β": new Howl({
      urls: ['/ipa-sounds/V_bilabial_fricative.mp3']
    }),

  "f": new Howl({
      urls: ['/ipa-sounds/VL_labiodental_fricative.mp3']
    }),
  "v": new Howl({
      urls: ['/ipa-sounds/V_labiodental_fricative.mp3']
    }),
  
  "θ": new Howl({
      urls: ['/ipa-sounds/VL_dental_fricative.mp3']
    }),

  "ð": new Howl({
      urls: ['/ipa-sounds/V_dental_fricative.mp3']
    }),

    "s": new Howl({
      urls: ['/ipa-sounds/VL_alveolar_fricative.mp3']
    }),

    "z": new Howl({
      urls: ['/ipa-sounds/V_alveolar_fricative.mp3']
    }),

    "ʃ": new Howl({
      urls: ['/ipa-sounds/VL_postalveolar_fricative.mp3']
    }),

      "ʒ": new Howl({
      urls: ['/ipa-sounds/V_postalveolar_fricative.mp3']
    }),

      "ʂ": new Howl({
      urls: ['/ipa-sounds/VL_retroflex_fricative.mp3']
    }),

    "ʐ": new Howl({
      urls: ['/ipa-sounds/V_retroflex_fricative.mp3']
    }),

    "ç": new Howl({
      urls: ['/ipa-sounds/VL_palatal_fricative.mp3']
    }),

    "ʝ": new Howl({
      urls: ['/ipa-sounds/V_palatal_fricative.mp3']
    }),

    "x": new Howl({
      urls: ['/ipa-sounds/VL_velar_fricative.mp3']
    }),

  "ɣ": new Howl({
      urls: ['/ipa-sounds/V_velar_fricative.mp3']
    }),

    "χ": new Howl({
      urls: ['/ipa-sounds/VL_uvular_fricative.mp3']
    }),

    "ʁ": new Howl({
      urls: ['/ipa-sounds/V_uvular_fricative.mp3']
    }),

    "ħ": new Howl({
      urls: ['/ipa-sounds/VL_pharyngeal_fricative.mp3']
    }),

    "ʕ": new Howl({
      urls: ['/ipa-sounds/V_pharyngeal_fricative.mp3']
    }),

    "h": new Howl({
      urls: ['/ipa-sounds/VL_glottal_fricative.mp3']
    }),

    "ɦ": new Howl({
      urls: ['/ipa-sounds/VL_glottal_fricative.mp3']
    }),

  "ɬ": new Howl({
      urls: ['/ipa-sounds/VL_alveolar_lateral-fricative.mp3']
    }),

  "ɮ": new Howl({
      urls: ['/ipa-sounds/V_alveolar_lateral-fricative.mp3']
    }),

"ʋ": new Howl({
      urls: ['/ipa-sounds/V_labialdental_approximant.mp3']
    }),

"ɹ": new Howl({
      urls: ['/ipa-sounds/V_alveolar_approximant.mp3']
    }),

"ɻ": new Howl({
      urls: ['/ipa-sounds/V_retroflex_approximant.mp3']
      }),
    
"j": new Howl({
      urls: ['/ipa-sounds/V_palatal_lateral-approximant.mp3']
    }),

"ɰ": new Howl({
      urls: ['/ipa-sounds/V_velar_approximant.mp3']
    }),
"l": new Howl({
      urls: ['/ipa-sounds/V_alveolar_lateral-approximant.mp3']
    }),
"ɭ": new Howl({
      urls: ['/ipa-sounds/V_retroflex_lateral-approximant.mp3']
    }),
"ʎ": new Howl({
      urls: ['/ipa-sounds/V_palatal_lateral-approximant.mp3']
    }),
"ʟ": new Howl({
      urls: ['/ipa-sounds/V_velar_lateral-approximant.mp3']
    }),

  }

  $('#chart td span').on("click", function(evt) {
  	var glyph = $(this).attr("data-glyph")

    if (sounds[glyph]) {
      sounds[glyph].play()
    }
  })
});

