require 'spec_helper'

describe "Genre" do
  before do 
    @artist = Artist.create(:name => "Taylor Swift") 

    blank_space =  Song.create(:name => "Blank Space", :artist => @artist) 

    pop = Genre.create(:name => "Pop")

    blank_space.genre_ids = pop.id
    
  end


  it "can initialize a genre" do
    expect(Genre.new).to be_an_instance_of(Genre)
  end

  it "has a name" do
    expect(genre.name).to eq("Pop")
  end

  it "has many songs" do
    expect(genre.songs.count).to eq(1)
  end

  it "has many artists" do
    expect(genre.artists.count).to eq(1)
  end

  it "can slugify it's name" do
    genre = Genre.create(:name => "Alternative Rock")
    genre.slug

    expect(genre.slug).to eq("alternative-rock")
  end

  describe "Class methods" do
    it "given the slug can find a genre" do
      genre = Genre.create(:name => "Alternative Rock")
      Genre.find_by_slug(genre.slug)

      expect((Genre.find_by_slug(genre.slug)).name).to eq("Alternative Rock")
    end
  end
end