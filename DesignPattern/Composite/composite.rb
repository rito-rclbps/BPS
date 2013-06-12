# -*- encoding: UTF-8 -*-
# error: superclass mismatched.
class Entry
  attr_accessor :name, :size
  def add(entry); end
  def to_s
    "#{:name} (#{:size})"
  end
  protected
    def print_list(prefix = ''); end
end

class File < Entry
  def initialize(name, size)
    @name = name
    @size = size
  end
  protected
    def print_list(prefix = '')
      puts "#{prefix}/#{self}"
    end
end

class Directory < Entry
  def initialize(name)
    @name = name
    @directory = []
  end
  def size
    size = 0
    @directory.each do |entry|
      size += entry.size
    end
  end
  def add(entry)
    @directory << entry
  end
  def print_list(prefix = '')
    puts "#{prefix}/#{self}"
    @directory.each do |entry|
      entry.print_list("#{prefix}/#{name}")
    end
  end
end

puts 'Making root entries...'
rootdir = Directory.new('root')
bindir = Directory.new('bin')
tmpdir = Directory.new('tmp')
usrdir = Directory.new('usr')
rootdir
.add(bindir)
.add(tmpdir)
.add(usrdir)
bindir
.add(File.new('vi', 10000))
.add(File.new('latex', 20000))
rootdir.print_list

puts
puts 'Making user entries...'
rito = Directory.new('rito')
mikan = Directory.new('mikan')
yami = Directory.new('yami')
usrdir
.add(rito)
.add(mikan)
.add(yami)
rito
.add(File.new('diary.html', 100))
.add(File.new('Composite.java', 200))
mikan
.add(File.new('memo.tex', 300))
.add(File.new('game.doc', 400))
.add(File.new('junk.mail', 500))
rootdir.print_list

