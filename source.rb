module Source
  extend self

  SURNAMES_FILE = 'surnames.txt'
  FEMALE_FILE = 'female.txt'
  MALE_FILE = 'male.txt'
  CONCEPTS_FILE = 'concepts.txt'
  SKILLS_FILE = 'skills.txt'
  MINOR_HINDRANCE = 'minor_hindrance.txt'
  MAJOR_HINDRANCE = 'major_hindrance.txt'
  EDGES_FILE = 'edges.txt'

  def surname
    @surnames ||= IO.readlines(File.join('data', SURNAMES_FILE)).map(&:chomp)
  end

  def female
    @female ||= IO.readlines(File.join('data', FEMALE_FILE)).map(&:chomp)
  end

  def male
    @male ||= IO.readlines(File.join('data', MALE_FILE)).map(&:chomp)
  end

  def concept
    @concept ||= IO.readlines(File.join('data', CONCEPTS_FILE)).map(&:chomp)
  end

  def skill
    @skill ||= IO.readlines(File.join('data', SKILLS_FILE)).map(&:chomp)
  end

  def minor_hindrance
    @minor_hindrance ||= IO.readlines(File.join('data', MINOR_HINDRANCE)).map(&:chomp)
  end

  def major_hindrance
    @major_hindrance ||= IO.readlines(File.join('data', MAJOR_HINDRANCE)).map(&:chomp)
  end

  def edges
    @edges ||= IO.readlines(File.join('data', EDGES_FILE)).map(&:chomp)
  end
end