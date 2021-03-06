require "rails_helper"

describe "/paper" do
  it "renders an HTML page", :points => 1 do
    visit "/paper"

    expect(page.status_code).to be(200)
  end
end

describe "/paper" do
  it "has the DOCTYPE declaration at the top of the page.", :points => 1 do
    visit "/paper"
    
    first_line = page.html.strip.downcase.first(15)
    doctype = "<!doctype html>"
    expect(first_line.include?(doctype) ).to be true
  end
end

describe "/paper" do
  it "has a meta tag that increases the types of characters we can use.", :points => 1 do
    visit "/paper"
    
    expect(page).to have_tag("html") do
      expect(page).to have_tag("head") do
        with_tag("meta", :with => { :charset => "utf-8" } )
      end
    end
  end
end

describe "/paper" do
  it "has the title 'You played paper!' ", :points => 1 do
    visit "/paper"
    
    expect(page).to have_tag("html") do
      expect(page).to have_tag("head") do
        with_tag("title", :seen => "You played paper!")
      end
    end
  end
end

describe "/paper" do
  it "has at least one link", :points => 1 do
    visit "/paper"
    
    expect(page).to have_tag("a", { :minimum => 1 } )
  end
end

describe "/paper" do
  it "has at least two links", :points => 1 do
    visit "/paper"
    
    expect(page).to have_tag("a", { :minimum => 2 } )
  end
end

describe "/paper" do
  it "has at least three links", :points => 3 do
    visit "/paper"
    
    expect(page).to have_tag("a", { :minimum => 3 } )
  end
end

describe "/paper" do
  it "has at most four links", :points => 1 do
    visit "/paper"
    
    expect(page).to have_tag("a", { :count => 4 } )
  end
end

describe "/paper" do
  it "has a link to '/rock' with the text 'Play Rock'", :points => 1 do
    visit "/paper"

    expect(page).to have_link("Play Rock", { :href => "/rock" } )
  end
end

describe "/paper" do
  it "has a link to '/paper' with the text 'Play Paper'", :points => 1 do
    visit "/paper"

    expect(page).to have_link("Play Paper", { :href => "/paper" } )
  end
end

describe "/paper" do
  it "has a link to '/scissors' with the text 'Play Scissors'", :points => 1 do
    visit "/paper"

    expect(page).to have_link("Play Scissors", { :href => "/scissors" } )
  end
end

describe "/paper" do
  it "has a link to '/' with the text 'Rules'", :points => 1 do
    visit "/paper"

    expect(page).to have_link("Rules", { :href => "/" } )
  end
end

describe "/paper" do
  it "has all 'Play'links on a separate line", :points => 3 do
    visit "/paper"

    expect(page).to have_tag("body") do
      with_tag("div") do
        with_tag("a", :with => { :href => "/rock" }, :seen => "Play Rock")
      end
      with_tag("div") do
         with_tag("a", :with => { :href => "/paper" }, :seen => "Play Paper")
      end
      with_tag("div") do
         with_tag("a", :with => { :href => "/scissors" }, :seen => "Play Scissors")
      end
    end
  end
end

describe "/paper" do
  it "has at least one secondary heading", :points => 1 do
    visit "/paper"
    
    expect(page).to have_tag("h2", { :minimum => 1 } )
  end
end

describe "/paper" do
  it "has at least two secondary headings", :points => 1 do
    visit "/paper"
    
    expect(page).to have_tag("h2", { :minimum => 2 } )
  end
end

describe "/paper" do
  it "has at most three secondary headings", :points => 1 do
    visit "/paper"
    
    expect(page).to have_tag("h2", { :count => 3 } )
  end
end

describe "/paper" do
  it "has one secondary heading with the text 'We played rock!'", :points => 1 do
    visit "/paper"
    
    expect(page).to have_tag("html") do
      expect(page).to have_tag("body") do
        with_tag("h2", { :seen => "We played paper!" } )
      end
    end
  end
end

describe "/paper" do
  it "has one secondary heading with the text 'They played paper!'", :points => 1 do
    visit "/paper"
    
    expect(page).to have_tag("html") do
      expect(page).to have_tag("body") do
        with_tag("h2", { :seen => "They played paper!" } )
      end
    end
  end
end

describe "/paper" do
  it "has one secondary heading with the text 'We tied!'", :points => 1 do
    visit "/paper"
    
    expect(page).to have_tag("html") do
      expect(page).to have_tag("body") do
        with_tag("h2", { :seen => "We tied!" } )
      end
    end
  end
end

describe "/paper" do
  it "has all elements in the right order", :points => 20 do
    visit "/paper"
    
    first_line = page.html.strip.downcase.first(15)
    doctype = "<!doctype html>"
    expect(first_line.include?(doctype) ).to be true
    
    expect(page).to have_tag("html") do
      with_tag("head") do
        with_tag("title", :text => "You played paper!" )
        with_tag("meta", :with => { :charset => "utf-8" } )
      end
      
      with_tag("body") do
        with_tag("div:first-child") do
          with_tag("a", :count => 1 )
          with_tag("a", :with => { :href => "/rock" }, :seen => "Play Rock")
        end
        with_tag("div:nth-child(2)") do
          with_tag("a", :count => 1 )
          with_tag("a", :with => { :href => "/paper" }, :seen => "Play Paper")
        end
        with_tag("div:nth-child(3)") do
          with_tag("a", :count => 1 )
          with_tag("a", :with => { :href => "/scissors" }, :seen => "Play Scissors")
        end
        
        with_tag("div:nth-child(3) + h2", :seen => "We played paper!")
        with_tag("h2:nth-of-type(2)", :seen => "They played paper!")
        with_tag("h2:nth-of-type(3)", :seen => "We tied!")
        
        with_tag("h2:nth-of-type(3) + a", :with => { :href => "/"}, :seen => "Rules")

      end
    end
  end
end
