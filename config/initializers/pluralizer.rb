# encoding : UTF-8

# Be sure to restart your server when you modify this file.

class Integer

  def pluralize(one, two, many)
    # http://translate.sourceforge.net/wiki/l10n/pluralforms
    n = self.to_i
    plural=(n%10==1 && n%100!=11 ? one : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? two : many)
  end
    
end

class Float

  def to_currency()
    unit_name = "р."
    subunit_name = "к."
    hundrets = [ '', 'сто', 'двести', 'триста', 'четыреста', 'пятьсот', 'шестьсот', 'семьсот', 'восемьсот', 'девятьсот' ]
    units = [ '', 'один', 'два', 'три', 'четыре', 'пять', 'шесть', 'семь', 'восемь', 'девять', 'десять', 'одиннадцать', 'двенадцать', 'тринадцать', 'четырнадцать', 'пятнадцать', 'шестнадцать', 'семнадцать', 'восемнадцать', 'девятнадцать' ]
    tens = [ '', '', 'двадцать', 'тридцать', 'сорок', 'пятьдесят', 'шестьдесят', 'семьдесят', 'восемьдесят', 'девяносто' ]
    thousands = [ '', 'одна', 'две', 'три', 'четыре', 'пять', 'шесть', 'семь', 'восемь', 'девять', 'десять', 'одиннадцать', 'двенадцать', 'тринадцать', 'четырнадцать', 'пятнадцать', 'шестнадцать', 'семнадцать', 'восемнадцать', 'девятнадцать' ]
 
    whole = self.to_i
    orig = whole
    cent = self - whole
    s = ''
    if (whole < 0)
      s = 'минус'
      whole = -whole
    end
    if (whole == 0)
      s = '0'
    else
      if (whole > 1000000)
        billions = whole/1000000
        whole -= 1000000*billions
        s << ' ' unless s.empty?
        s << Float.digit_to_s(billions, units, tens, hundrets, thousands) << ' ' << billions.pluralize('миллион', 'миллиона', 'миллионов')
      end
      if (whole > 1000)
        ths = whole/1000
        whole -= 1000*ths
        s << ' ' unless s.empty?
        s << Float.digit_to_s(ths, units, tens, hundrets, thousands) << ' ' << ths.pluralize('тысяча', 'тысячи', 'тысяч')
      end
      if (whole > 0)
        s << ' ' unless s.empty?
        s << Float.digit_to_s(whole, units, tens, hundrets, thousands)
      end
    end
    "#{s} #{orig.pluralize('рубль', 'рубля', 'рублей')} #{(cent*100 + 0.5).to_i} коп."
  end

private

  def self.digit_to_s(num, units, tens, hunds, ths)
    if (num > 999)
      return num.to_s
    end
    s = ''
    if (num > 99)
      hs = num/100
      num -= 100*hs
      s << hunds[hs]
    end
    if (num > 19)
      ds = num/10
      num -= 10*ds
      s << ' ' unless s.empty? || tens[ds].empty?
      s << tens[ds]
    end
    if (num > 0)
      s << ' ' unless s.empty? || units[num].empty?
      s << units[num]
    end
    s
  end

end
