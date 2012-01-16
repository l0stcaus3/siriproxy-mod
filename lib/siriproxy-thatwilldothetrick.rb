require 'cora'
require 'siri_objects'
require 'open-uri'
require 'pp'
require 'url_escape'
#require 'rubygems' # edited on 08 01 2012
#require 'appscript'
#require 'appscript' # edited on 08 01 2012
#include Appscript# edited on 08 01 2012
#require 'osax' # edited on 08 01 2012
#include OSAX# edited on 08 01 2012


class SiriProxy::Plugin::ThatWillDoTheTrick < SiriProxy::Plugin
  def initialize(config)
    #if you have custom configuration options, process them here!
  end

  #get the user's location and display it in the logs
  #filters are still in their early stages. Their interface may be modified
  filter "SetRequestOrigin", direction: :from_iphone do |object|
    puts "[Info - User Location] lat: #{object["properties"]["latitude"]}, long: #{object["properties"]["longitude"]}"
    
    #Note about returns from filters:
    # - Return false to stop the object from being forwarded
    # - Return a Hash to substitute or update the object
    # - Return nil (or anything not a Hash or false) to have the object forwarded (along with any
    # modifications made to it)
  end
  
  ##############################################################################
  # Six, Siri's new name for personnal cmds
  
  # Six awaken ?
  #listen_for /six are you awake/i do
  #  say "Yup Sir, I am right here , up and running better than ever! ...and just a little fly"
    
  #  request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  #end
  
  # Six's daddy ?
  listen_for /six who's your daddy/i do
    say "I am your bitch!"
    
    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end
  
  #demonstrate asking a question
  listen_for /six are you mad at me/i do
    response = ask "What the fuck bitch?" #ask the user for something
    
    if(response =~ /fuck you/i) #process their response
      say "With great pleasure! Do you want to split my ass today ? And then continue to fuck me untill I bleed like the dirty whore I am ?"
    else
      say "You could have so much fun with me so horny!"
    end
    
    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end
  
  listen_for /you awake/i do
    say "Well I am now,this better be important!!!"
    
    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end

 listen_for /zeb/i do
     response = ask "You know how I know he is gay?"
     
     
     if(response =~ /his pink ipod/i)
     say "You guessed it,Only a fag would have a pink iPod"
     
     else
     say "just look at him"
     end
     
     request_completed
  end 

  listen_for /say (.*) to (.*)/i do |greet, name|
     say "#{greet} #{name}, Would you PLEASE show my master your tits?!!!"
    
    request_completed
    end

listen_for /muscles/i do
    say"Damn Tony, you are looking swole"
    
request_completed
end

   listen_for /Donald/i do
        say "Don,I hope you had a great day, Hold your head up HIGH,walk tall and proud,and remember, YOU NEVER HAD IT SO GOOD"
        
        request_completed
        end
        
        listen_for /jimmy/i do
        say "I wish you the best of luck in your next playoff game.Your gonna need it cause you suck.....Just kidding Jimbo
love you !"
        
        request_completed
        end


  listen_for /cam/i do
   response = ask "Nice one?"
   
   if(response =~ /yes/i)
    say" Todd told me to tell you he is really sorry he can give you what you want right now, it does not change the fact
he think's you are groovy,and really enjoys being with you"
   
  else
  say "I love it when you squirt!"
  end
  
  request_completed
  end
  
  #demonstrate capturing data from the user (e.x. "Siri proxy number 15")
  listen_for /six favorite number ([0-9,]*[0-9])/i do |number|
    say "Your new favorite number, Sir: #{number}"
    
    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end
  
  #demonstrate injection of more complex objects without shortcut methods.
  listen_for /six map/i do
    add_views = SiriAddViews.new
    add_views.make_root(last_ref_id)
    map_snippet = SiriMapItemSnippet.new
    map_snippet.items << SiriMapItem.new
    utterance = SiriAssistantUtteranceView.new("Testing map injection!")
    add_views.views << utterance
    add_views.views << map_snippet
    
    #you can also do "send_object object, target: :guzzoni" in order to send an object to guzzoni
    send_object add_views #send_object takes a hash or a SiriObject object
    
    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end
end

