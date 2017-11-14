require 'award'

class Item
  attr_reader :quality, :expires_in

  def initialize(quality, expires_in)
    @quality, @expires_in = quality, expires_in
  end

  def update_award_quality
  end
end

class BlueFirst < Item
  def update_award_quality
    @quality += 1
    @quality += 1 if @expires_in <= 0
    @quality = 50 if @quality > 50

    @expires_in -= 1
  end
end

class BlueCompare < Item
  def update_award_quality
    if @expires_in > 0
      @quality += 1
      @quality += 1 if @expires_in <= 10
      @quality += 1 if @expires_in <= 5
      @quality = 50 if @quality > 50
    else
      @quality = 0
    end

    @expires_in -= 1
  end
end

class BlueStar < Item
  def update_award_quality
    @quality -= 2 if @expires_in > 0
    @quality -= 4 if @expires_in <= 0
    @quality = 0 if @quality < 0

    @expires_in -= 1
  end
end

class Normal < Item
  def update_award_quality
    @quality -= 1 if @expires_in > 0
    @quality -= 2 if @expires_in <= 0
    @quality = 0 if @quality < 0

    @expires_in -= 1
  end
end

CLASS_NAMES = {
  'Blue First' => BlueFirst,
  'Blue Compare' => BlueCompare,
  'Blue Star' => BlueStar,
  'Blue Distinction Plus' => Item,
  'NORMAL ITEM' => Normal
}

def update_quality(awards)
  awards.each do |award|
    test = CLASS_NAMES[award.name].new(award.quality, award.expires_in)
    test.update_award_quality
    award.quality = test.quality
    award.expires_in = test.expires_in
  end
end
