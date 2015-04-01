require 'test_helper'

describe Mixtape::Source::Nme, :vcr do
  describe ".best_new_tracks" do
    it "picks 5 songs from the first page, 3 from the second and 2 for the last" do
      page_one_songs = [
        Mixtape::Song.new("The Vaccines", "Dream Lover"),
        Mixtape::Song.new("Brandon Flowers", "Can’t Deny My Love"),
        Mixtape::Song.new("Kendrick Lamar", "King Kunta"),
        Mixtape::Song.new("Lusts", "Mouthwash"),
        Mixtape::Song.new("Bully", "I Remember"),
        Mixtape::Song.new("Hudson Mohawke", "Very First Breath"),
        Mixtape::Song.new("Grimes x Bleachers", "Entropy"),
        Mixtape::Song.new("Pill", "Misty Eyed Porno Reader"),
        Mixtape::Song.new("Future Flocka", "Rotation"),
        Mixtape::Song.new("Jonny Greenwood", "Lola Choir"),
        Mixtape::Song.new("Sufjan Stevens", "Carrie & Lowell"),
        Mixtape::Song.new("Death Grips", "On GP"),
        Mixtape::Song.new("Sheer Mag", "Button Up"),
        Mixtape::Song.new("Jaakko Eino Kalevi", "Double Talk"),
        Mixtape::Song.new("Years & Years", "Worship"),
        Mixtape::Song.new("James Murphy", "We Used To Dance"),
        Mixtape::Song.new("Blur", "There Are Too Many Of Us"),
        Mixtape::Song.new("Nai Harvest", "All The Time"),
        Mixtape::Song.new("Rolo Tomassi", "Stage Knives"),
        Mixtape::Song.new("Girls Names", "Zero Triptych")
      ]
      page_three_songs = [
        Mixtape::Song.new("M83 & Haim", "Holes In The Sky"),
        Mixtape::Song.new("Mumford & Sons", "Believe"),
        Mixtape::Song.new("Crows", "Crawling"),
        Mixtape::Song.new("Drenge", "Never Awake"),
        Mixtape::Song.new("Major Lazer", "Lean On"),
        Mixtape::Song.new("Gengahr", "Haunter"),
        Mixtape::Song.new("Kelela", "A Message"),
        Mixtape::Song.new("Faith No More", "Superhero"),
        Mixtape::Song.new("Doldrums", "Loops"),
        Mixtape::Song.new("Holly Miranda", "All I Want Is To Be Your Girl"),
        Mixtape::Song.new("Action Bronson", "Baby Blue (feat. Chance The Rapper)"),
        Mixtape::Song.new("Pins", "Too Little Too Late"),
        Mixtape::Song.new("Outfit", "Genderless"),
        Mixtape::Song.new("Vant", "Parasite"),
        Mixtape::Song.new("Toro Y Moi", "Buffalo"),
        Mixtape::Song.new("My Morning Jacket", "Big Decisions"),
        Mixtape::Song.new("Speedy Ortiz", "The Graduates"),
        Mixtape::Song.new("Braids", "Taste"),
        Mixtape::Song.new("Kanye West", "U Mad feat. Vic Mensa"),
        Mixtape::Song.new("Holly Herndon", "Interference")
      ]
      page_five_songs = [
        Mixtape::Song.new("Blur", "Go Out"),
        Mixtape::Song.new("Wolf Alice", "Giant Peach"),
        Mixtape::Song.new("Chance The Rapper & The Social Experiment", "Lady Friend"),
        Mixtape::Song.new("Sufjan Stevens", "No Shade In The Shadow Of The Cross"),
        Mixtape::Song.new("Action Bronson", "Terry"),
        Mixtape::Song.new("Jon Hopkins", "I Remember"),
        Mixtape::Song.new("Modest Mouse", "The Ground Walks, With Time In A Box"),
        Mixtape::Song.new("East India Youth", "Turn Away"),
        Mixtape::Song.new("Angel Haze", "Gxmes"),
        Mixtape::Song.new("Father John Misty", "Heart-Shaped Box"),
        Mixtape::Song.new("Earl Sweatshirt", "Quest/Power"),
        Mixtape::Song.new("Big Sean", "One Man Can Change The World"),
        Mixtape::Song.new("Together Pangea", "I Looked In Too"),
        Mixtape::Song.new("Pussy Riot", "I Can't Breathe (feat. Richard Hell)"),
        Mixtape::Song.new("Jacco Gardner", "Find Yourself"),
        Mixtape::Song.new("Torres", "Sprinter"),
        Mixtape::Song.new("Chromatics", "Just Like You"),
        Mixtape::Song.new("White Shadows", "Give Up Give Out Give In"),
        Mixtape::Song.new("Questlove/ Black Thought/ Charli XCX", "Groove Is In The Heart"),
        Mixtape::Song.new("Twin Shadow", "I’m Ready")
      ]
      top_ten_tracks = Mixtape::Source::Nme.best_new_tracks

      intersection_page_one   = top_ten_tracks[0..4] & page_one_songs
      intersection_page_three = top_ten_tracks[5..7] & page_three_songs
      intersection_page_five  = top_ten_tracks[8..9] & page_five_songs

      intersection_page_one.wont_be_empty
      intersection_page_three.wont_be_empty
      intersection_page_five.wont_be_empty
    end
  end
end
