class Plot < ActiveRecord::Base
  @@nouns = ["A man", "A woman", "A whale", "A ghost", "A cat", "Marc", "Sara"]
  @@verbs = ["walks into a bar", "cries out", "vanishes", "appears", "has a picnic", "goes for a bicycle ride", "reads a book", "kisses a stranger", "plays the flute", "eats a sandwich"]
  @@settings = ["by the seaside", "in New York City", "in a small mountain town", "in Central Park", "on the beach", "in Tokyo", "in a dark alley", "in an abandoned Victorian mansion"]

  def self.generate_plot
    noun_index = rand(@@nouns.length)
    verb_index = rand(@@verbs.length)
    setting_index = rand(@@settings.length)

    noun = @@nouns[noun_index]
    verb = @@verbs[verb_index]
    setting = @@settings[setting_index]

    [noun, " ", verb, " ", setting]
  end

end
