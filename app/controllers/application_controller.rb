require "sinatra/base"

class App < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/") }
  get "/" do
    erb :super_hero
  end

  post "/teams" do
    params[:team][:members].each do |m|
      Hero.new(m)
    end

    team_name = params[:team][:name]
    motto_name = params[:team][:motto]
    @team = Team.new(team_name, motto_name)
    @heroes = Hero.all
    # binding.pry
    erb :team
  end
end
