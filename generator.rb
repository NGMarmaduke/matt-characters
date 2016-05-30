require_relative 'source'
require_relative 'character'
require 'erb'

class Generator
  CHARACTER_COUNT = 100
  ATTRIBUTE_MAP = {
    gender: [:male, :female],
    height: [
      '5 foot 1', '5 foot 2', '5 foot 3', '5 foot 4', '5 foot 5', '5 foot 6',
      '5 foot 7', '5 foot 8', '5 foot 9', '5 foot 10', '5 foot 11', '5 foot 12',
      '6 foot 1', '6 foot 2', '6 foot 3', '6 foot 4', '6 foot 5', '6 foot 6',
    ],
    skin: ['pale', 'tanned', 'dark'],
    eyes: ['blue', 'brown'],
    hair: ['blonde', 'brown', 'black'],
    attributes: ['Agility', 'Smarts', 'Spirit', 'Strength', 'Vigor'],
    attribute_dice: ['d4', 'd6', 'd8', 'd10'],
    skill_count: 6,
    skills_dice: ['d4', 'd6', 'd8', 'd10'],
    minor_hindrances: 2,
    major_hindrances: 1,
    edges_count: 3
  }

  ERB_TEMPLATE = 'characters.html.erb'
  OUTPUT_HTML = 'characters.html'

  def perform
    @characters = characters

    renderer = ERB.new(File.read(ERB_TEMPLATE))
    File.write(OUTPUT_HTML, renderer.result(binding))
  end

  private

  def characters
    CHARACTER_COUNT.times.map{ |i| Character.new }
  end
end