class Song
  
  def initialize(user_title, user_artist, user_album, user_length)
    @title = user_title
    @artist = user_artist
    @album = user_album
    @length = user_length
    @play = true
  end
  
  attr_reader :title, :artist, :album, :length
  
  def play
    puts "You are listening to #{@title} by #{@artist}"
    current_time = 0.0
    while (@play == true)
    sleep(1)
    current_time = current_time + 1
    puts Time.at(current_time).utc.strftime("%M:%S")
      if current_time > @length.to_f || @play == false
         @play = false
      end 
    end
    @play = true
  end
    
  def pause
    @play = false
    puts "HEllo"
  end
    
end

class Playlist
  def initialize(name)
    @name = name
    @songs = []
  end
  attr_reader :name
  attr_accessor :songs
  def add_to_playlist(song_object)
    @songs << song_object
  end
  
  def del_from_playlist(song_object)
    if @songs.include?(song_object)
      @songs.delete_if {|i| i == song_object}
    end
  end
  
  
end

def remove_playlist(array, playlist_name)
  if array.include?(playlist_name)
    array.delete_if {|i| i == playlist_name}
  end
end

def add_playlist(array, name)
  array << Playlist.new(name)  
end
  
playlists = []
counter = 0
user_input = ""
while user_input != "end" do
  puts "If you would like to modify your playlists and songs enter 'modify'. If you would like to play music enter 'play'."
  puts "You and can list you current playlists and songs by entering 'list'. To exit the program enter 'end'."
  user_input = gets.chomp
  if user_input == "modify"
    while user_input != "back" do
      puts "Would you like to modify playlists or songs? Enter 'playlist' for playlists and 'song' for songs. To go back enter 'back'."
      user_input = gets.chomp

      if user_input == "playlist"
        puts "To use add a playlist enter 'add'. To remove a playlist enter remove 'remove'."
        user_input = gets.chomp
        if user_input == "add"
          puts "Please enter the name of your playlist"
          name = gets.chomp
          add_playlist(playlists, name)
          puts "You created a playlist named #{playlists[counter].name}"
          counter +=1
        elsif user_input == "remove"
          puts "Please enter the name of the playlist you would like to remove"
          name = gets.chomp
          playlists.each do |playlist|
            if playlist.name == name
              remove_playlist(playlists, playlist)
            end
          end
          puts "You removed playlist named #{name}"
        else
          puts "This feature is not included in our program yet."
        end


      elsif user_input == "song"
        puts "To use add a song enter 'add'. To remove a song enter remove 'remove'."
        user_input = gets.chomp
        if user_input == "add"  
          puts "Enter the playlist you would like to add the song to."
          playlist_name = gets.chomp
          while user_input != "no"
            puts "Enter the title, artist, album and length of your song."
            title = gets.chomp
            artist = gets.chomp
            album = gets.chomp
            length = gets.chomp
            playlists.each do |list|
              if list.name == playlist_name
                list.add_to_playlist(Song.new(title, artist, album, length))
              end
            end
            puts "If you would like to add another song into the same playlist enter 'yes'. If not enter 'no'."
            user_input = gets.chomp
          end

        elsif user_input == "remove"
          puts "Enter the playlist you would like to remove the song from."
          playlist_name = gets.chomp
          while user_input != "no"
            puts"Enter the title and artist of the song you would like to remove."
            song_name = gets.chomp
            artist = gets.chomp
            playlists.each do |list|
              if list.name == playlist_name
                list.songs.each do |song|
                  if song.title == song_name && song.artist == artist
                    list.del_from_playlist(song)
                  end
                end
              end 
            end
            puts "If you would like to remove another song from the same playlist enter 'yes'. If not enter 'no'"
          end
        end
      end
    end
  
  elsif user_input == "play"
    while user_input != "back" do
      puts "Enter 'shuffle' if you would like to shuffle random songs on a playlist or enter 'search' if you would like to play a specific song. To go back enter 'back'."
      user_input = gets.chomp
      if user_input == "search"
        puts "What song would you like to play? Enter title of song and name of arist."
        title = gets.chomp
        artist = gets.chomp
        playlists.each do |list|
          list.songs.each do |song|
            if song.title == title &&  song.artist == artist
              song.play
            end
          end 
        end

      elsif user_input == "shuffle"
        puts "Please enter the name of the playlist you would like to shuffle play."
        playlist_name = gets.chomp        
        while user_input != "stop"
          playlists.each do |list|
            if list.name == playlist_name
              list.songs[rand(list.songs.length)].play
            end
          end
          puts"Enter 'stop' at to back out of shuffle mode. Hit any key to continue shuffling."
          user_input = gets.chomp
        end
      end
    end
    
  elsif user_input == "list"
    puts "---------------------------------------"
    puts "List of Playlist and songs".upcase
    playlists.each do |playlist|
      puts playlist.name
      playlist.songs.each do |song|
        print "- Song: #{song.title} Artist: #{song.artist} Album: #{song.album} Length: #{song.length} seconds."
        puts ""
      end
    end
    puts "_______________________________________"
  end 
end
