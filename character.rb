class Character

  def name
    @name ||= "#{ Source.send(gender).sample } #{ Source.surname.sample }"
  end

  def gender
    @gender ||= Generator::ATTRIBUTE_MAP[:gender].sample
  end

  def pronoun
    @pronoun ||= {
      male: 'He',
      female: 'She'
    }[gender]
  end

  def height
    @height ||= Generator::ATTRIBUTE_MAP[:height].sample
  end

  def skin
    @skin ||= Generator::ATTRIBUTE_MAP[:skin].sample
  end

  def eyes
    @eyes ||= Generator::ATTRIBUTE_MAP[:eyes].sample
  end

  def hair
    @hair ||= Generator::ATTRIBUTE_MAP[:hair].sample
  end

  def concept
    @concept ||= Source.concept.sample
  end

  def attributes
    @attributes ||= Generator::ATTRIBUTE_MAP[:attributes].map { |attribute|
      "#{ attribute } #{ Generator::ATTRIBUTE_MAP[:attribute_dice].sample }"
    }
  end

  def skills
    @skills ||= Source.skill.sample(Generator::ATTRIBUTE_MAP[:skill_count]).map { |skill|
      "#{ skill } #{ Generator::ATTRIBUTE_MAP[:skills_dice].sample }"
    }
  end

  def toughness
    @toughness ||= begin
      vigor = attributes.find{|atr| atr.include?('Vigor') }.match(/\d+/).to_s.to_i
      vigor / 2 + 2
    end
  end

  def hindrances
    @hindrances ||= begin
      Array(Source.major_hindrance.sample(Generator::ATTRIBUTE_MAP[:major_hindrances])) +
      Array(Source.minor_hindrance.sample(Generator::ATTRIBUTE_MAP[:minor_hindrances]))
    end
  end

  def edges
    @edges ||= Source.edges.sample(Generator::ATTRIBUTE_MAP[:edges_count])
  end
end