# encoding : UTF-8

# Be sure to restart your server when you modify this file.

class Integer

  def pluralize(one, two, many)
    # http://translate.sourceforge.net/wiki/l10n/pluralforms
    n = self.to_i
    plural=(n%10==1 && n%100!=11 ? one : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? two : many)
  end
    
end

class BigDecimal

  def to_currency()
    whole = self.to_i
    orig = whole
    cent = self - whole
    s = ''
    lc = BigDecimal.locale
    if whole < 0
      s << lc[:minus]
      whole = -whole
    end
    if whole == 0
      s << '0'
    else
      whole = BigDecimal.add_range s, whole, 1000000000000
      whole = BigDecimal.add_range s, whole, 1000000000
      whole = BigDecimal.add_range s, whole, 1000000
      whole = BigDecimal.add_range s, whole, 1000
      if whole > 0
        s << ' ' unless s.empty?
        s << BigDecimal.digit_to_s(whole, lc)
      end
    end
    rem = (cent*100 + 0.5).to_i
    "#{s} #{orig.pluralize(*lc[:currency][:whole])} #{rem} #{rem.pluralize(*lc[:currency][:cent])}"
  end

private

  @@ru = {
    :minus => 'минус',
    :hundreds => %w(0 сто двести триста четыреста пятьсот шестьсот семьсот восемьсот девятьсот),
    :units => %w(0 один два три четыре пять шесть семь восемь девять десять одиннадцать двенадцать тринадцать
                 четырнадцать пятнадцать шестнадцать семнадцать восемнадцать девятнадцать),
    :tens => %w(0 1 двадцать тридцать сорок пятьдесят шестьдесят семьдесят восемьдесят девяносто),
    :thousands => %w(0 одна две три четыре пять шесть семь восемь девять десять одиннадцать двенадцать тринадцать
                     четырнадцать пятнадцать шестнадцать семнадцать восемнадцать девятнадцать),
    :currency => { :whole => %w(рубль рубля рублей),
                   :cent => %w(коп. коп. коп.)
    },
    :ranges => { :'1000' => %w(тысяча тысячи тысяч),
                 :'1000000' => %w(миллион миллиона миллионов),
                 :'1000000000' => %w(миллиард миллиарда миллиардов),
                 :'1000000000000' => %w(триллион триллиона триллионов)
    }
  }

  def self.locale
    @@ru
  end

  # [CR] It is bad that 's' variable is changing indirectly
  #      however it makes function call neater
  def self.add_range(s, whole, range, lc = BigDecimal.locale)
    if whole > range
      triple = whole/range
      whole -= range*triple
      s << ' ' unless s.empty?
      s << BigDecimal.digit_to_s(triple, lc) << ' ' << triple.pluralize(*(lc[:ranges][range.to_s.to_sym]))
    end
    whole
  end

  def self.digit_to_s(num, lc = BigDecimal.loacle)
    if num > 999
      return num.to_s
    end
    s = ''
    if num > 99
      hs = num/100
      num -= 100*hs
      s << lc[:hundreds][hs]
    end
    if num > 19
      ds = num/10
      num -= 10*ds
      s << ' ' unless s.empty? || lc[:tens][ds].empty?
      s << lc[:tens][ds]
    end
    if num > 0
      s << ' ' unless s.empty? || lc[:units][num].empty?
      s << lc[:units][num]
    end
    s
  end

end
