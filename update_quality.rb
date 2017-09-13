require 'award'

def update_quality(awards)
  awards.each do |award|
    if award.name == 'Blue First'
      award.quality += 1 if award.quality < 50
      award.quality += 1 if award.expires_in <= 0 && award.quality < 50
    elsif award.name == 'Blue Compare'
      if award.expires_in > 0
        award.quality += 1 if award.quality < 50
        award.quality += 1 if award.expires_in <= 10 && award.quality < 50
        award.quality += 1 if award.expires_in <= 5 && award.quality < 50
      else
        award.quality = 0
      end
    elsif award.name == 'Blue Star'
      if award.expires_in > 0
        award.quality -= 2 if award.quality > 0
      else
        award.quality -= 4 if award.quality >= 4
      end
    elsif award.name != 'Blue Distinction Plus'
      if award.expires_in > 0
        award.quality -= 1 if award.quality > 0
      else
        award.quality -= 2 if award.quality >= 2
      end
    end

    award.expires_in -= 1 if award.name != 'Blue Distinction Plus'
  end
end
