require 'spec_helper'

describe "Tumblr" do

  before :all do
    @b = Watir::Browser.new
    @b.goto "https://www.tumblr.com/"
  end

  it "should load in details from a YAML file" do
    d = YAML.load(File.open("./details.yaml"))
    expect(d["details"].to_a.size).to eq 2
    expect(d["details"]["email"]).to eq "osmanidiana@gmail.com"
    expect(d["details"]["password"]).to eq "OSMANI007"
  end

  it "should get into the login page" do
    @b.button(id: "signup_login_button").click
    expect(@b.url).to eq "https://www.tumblr.com/login"
  end

  it "should allow the user to login" do
    d = YAML.load(File.open("./details.yaml"))
    @b.input(name:"determine_email").send_keys d["details"]["email"]
    @b.button(id:"signup_forms_submit").click
    @b.input(name:"user[password]").when_present.send_keys d["details"]["password"]
    @b.button(id:"signup_forms_submit").click
    expect(@b.url).to eq "https://www.tumblr.com/dashboard"
  end

  it "should get into post box page" do
    @b.div( id: "new_post").a(id:"new_post_label_text").click
    expect(@b.url).to eq "https://www.tumblr.com/new/text"
  end

  it "should create a post" do
    @b.div(class: "editor-plaintext").send_keys"Hope this works"
    @b.div(class:"editor editor-richtext").click
    @b.div(class:"editor editor-richtext").send_keys"I believe my good man, that it works and it works well."
    @b.button(class:"button-area create_post_button").when_present.click
    title=@b.div(class:"post_container").when_present.div(class:"post_title")
    expect(title.text).to eq "Hope this works"
  end

  it "should have created the post" do
  @b.div(class: "post-forms-glass post-forms-glass_active active").wait_while_present
  # It basically waits for the element to dissapear
   @b.div(id:"account_button").button(class:"tab_anchor").when_present.click
   @b.li(class:"blog-sub-nav-item").when_present.click
   expect(@b.text.include? "Hope this works").to be true
  end

  after :all do
   @b.close
  end

end
