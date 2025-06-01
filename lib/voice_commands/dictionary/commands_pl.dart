const triggerWord = "krystyna";
const commandOn = "włącz";
const commandOff = "wyłącz";

const Map<String, String> commandNames = {
  "toggle_on": "włączam",
  "toggle_off": "wyłączam",
};

const Map<String, Map<String, dynamic>> targets = {
  "desk_lamp": {
    "phrases": ["lampę na parapecie", "parapet"],
    "devices": ["desk_lamp"],
    "response": ["lampę na parapecie"],
  },
  "dresser_lamp": {
    "phrases": ["lampę na komodzie", "komoda"],
    "devices": ["dresser_lamp"],
    "response": ["lampę na komodzie"],
  },
  "ceiling_light_1": {
    "phrases": ["pierwsze światło górne"],
    "devices": ["ceiling_light_1"],
    "response": ["pierwsze światło górne"],
  },
  "ceiling_light_2": {
    "phrases": ["drugie światło górne"],
    "devices": ["ceiling_light_2"],
    "response": ["drugie światło górne"],
  },
  "little_lights": {
    "phrases": ["świecidełka"],
    "devices": ["little_lights"],
    "response": ["świecidełka"],
  },
  "tv_mode": {
    "phrases": ["oświetlenie do telewizji", "tryb tv"],
    "devices": ["desk_lamp", "dresser_lamp", "little_ligths"],
    "response": ["oświetlenie do telewizjij"],
  },
  "all_mode": {
    "phrases": ["całe oświetlenie", "wszystkie światła"],
    "devices": ["ceiling_light_1", "ceiling_light_2", "little_ligth", "dresser_lamp", "desk_lamp"],
    "response": ["wszystkie światłą"],
  }
};
