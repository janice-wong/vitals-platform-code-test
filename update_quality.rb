require 'award'

def update_quality(awards)
  awards.each do |award|
    if award.name == 'Blue First'
      if award.expires_in.positive?
        award.quality < 49 ? award.quality += 1 : award.quality = 50
      else
        award.quality < 49 ? award.quality += 2 : award.quality = 50
      end
    elsif award.name == 'Blue Compare'
      if award.expires_in.positive? && award.expires_in <= 5
        award.quality < 47 ? award.quality += 3 : award.quality = 50
      elsif award.expires_in.positive? && award.expires_in <= 10
        award.quality < 48 ? award.quality += 2 : award.quality = 50
      elsif award.expires_in.positive?
        award.quality < 49 ? award.quality += 1 : award.quality = 50
      else
        award.quality = 0
      end
    elsif award.name == 'Blue Star'
      if award.expires_in.positive?
        award.quality > 2 ? award.quality -= 2 : award.quality = 0
      else
        award.quality > 4 ? award.quality -= 4 : award.quality = 0
      end
    elsif award.name != 'Blue Distinction Plus'
      if award.expires_in.positive?
        award.quality.positive? ? award.quality -= 1 : award.quality = 0
      else
        award.quality > 2 ? award.quality -= 2 : award.quality = 0
      end
    end

    award.expires_in -= 1 if award.name != 'Blue Distinction Plus'
  end
end
