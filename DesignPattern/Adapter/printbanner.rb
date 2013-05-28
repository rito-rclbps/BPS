# -*- encoding : utf-8 -*-
class PrintBanner < Banner
  def initialize(string)
    @string = string
  end
  def print_weak
    show_with_paren(@string)
  end
  def print_strong
    show_with_aster(@string)
  end
end
