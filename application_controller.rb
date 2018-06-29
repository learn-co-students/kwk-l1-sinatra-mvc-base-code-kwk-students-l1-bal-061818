require 'bundler'
Bundler.require
require_relative 'models/questions.rb'

class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end
  get '/community.erb' do
      erb :community
    end
    get '/groups.erb' do
      erb :groups
    end
    get '/help.erb' do
      erb :help
    end
    get '/more_info.erb' do
      erb :more_info
    end
    get '/quiz' do
      erb :quiz
    end

    post '/results' do
      answers = params.values
      @total = 0
      answers.each do |answer|
      @total += answer.to_i
    end
    puts @total

    @person = environment_chooser(@total)
    if @person == "crusader"
      erb :Earth_crusader
    elsif @person == "ameteur"
      erb :Earthy_ameteur
    elsif @person == "aware"
      erb :Earthy_aware
    end
  end
  end
