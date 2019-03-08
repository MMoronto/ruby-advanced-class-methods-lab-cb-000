class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create
    song = Song.new
    @@all << song  
    song 
  end 
  
   def self.new_by_name(string)
    song = self.new
    song.name = string
    song
  end
  
   def self.create_by_name(string)
    song = self.new
    song.name = string
    @@all << song
    song 
  end 
  
  def self.find_by_name(string)
    @@all.find{|song| song.name == string}
  end 
  
   def self.find_or_create_by_name(string)
    @@all.find{|song| song.name == string}
    else
    song = self.new
    song.name = string
    song
  end 
  
  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end 
  
  def self.new_from_filename(string)
    rows = string.split(".mp3")
    songs = rows.collect do |row|
    data = row.split(", ")
    name = data[0]
    artist_name = data[1]

    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
    end
    songs
  end 

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
