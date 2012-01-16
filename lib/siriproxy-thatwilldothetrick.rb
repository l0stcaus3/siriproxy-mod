require 'cora'
require 'siri_objects'
require 'open-uri'
require 'pp'
require 'url_escape'
require 'rubygems' # edited on 08 01 2012
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
  
  
  # Six's daddy's wife ?
  ##listen_for /six who's my wife/i do
  #  say "A dear made of wood whose name is Roxanne and that my lord used to love!"
    
  #  request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  #end
  
 # listen_for /six who's my Kelly/i do
 #   say "A great woman my lord used to fell in love with! ....      ... no comments ...."
    
 #   request_completed #always complete your request! Otherwise the phone will "spin" at the user!
 # end
  
  
  # about the weed ?
 # listen_for /six any weed left/i do
 #   say "Sure Sir, we need Weed to workout out smokey way in that long hard work night! ...for my part, I smoke weed everyday"
    
   # request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end
  
  
  
  #Should another join ?
 # listen_for /six should I roll another join/i do
  #  say "Sometimes it's the only way ...", spoken: "Actually, everytime...this is it!"
#  end
  
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
  
  ##############################################################################
  # Six, remote computing cmds
  
  
  #########################################################
  # testing remote iphone cmds
  
#  listen_for / iPhone iTunes/i do
#    iPhoneiTunes = Appscript.app.by_url("eppc://SiriAdmin:siritest@192.168.1.108/iTunes")
#    iPhoneiTunes.play
#   say "They don't want the music, they don't know how to use it"
    
#    request_completed
#  end
  
  #########################################################
  
  
  
  
  # remote commands using rb-appscript language#
#  listen_for /Six iMac iTunes/i do
#    Appscript.app.by_url("eppc://SiriAdmin:siritest@192.168.1.13/Finder").application_files.ID("com.apple.iTunes").open
#    iMaciTunes = Appscript.app.by_url("eppc://SiriAdmin:siritest@192.168.1.13/iTunes")
#    iMaciTunes.play
#    say "They don't want the music, they don't know how to use it"
    
#    request_completed
#  end
  
#  listen_for /Six macbook iTunes/i do
#    Appscript.app.by_url("eppc://SiriAdmin:siritest@192.168.1.17/Finder").application_files.ID("com.apple.iTunes").open
#    macbookiTunes = Appscript.app.by_url("eppc://SiriAdmin:siritest@192.168.1.7/iTunes")
#    macbookiTunes.play
#    say "I just launched iTunes on your macbookpro for you"
    
#    request_completed
#  end
  
#  listen_for /Six iMac iTunes play/i do
#    iMaciTunes = Appscript.app.by_url("eppc://SiriAdmin:siritest@192.168.1.13/iTunes")
#    iMaciTunes.play if iMaciTunes.is_running?
      
#    say "I just slapped the troubadour's ass"
    
#    request_completed
#  end
  
#  listen_for /Six iMac iTunes stop/i do
#    iMaciTunes = Appscript.app.by_url("eppc://SiriAdmin:siritest@192.168.1.13/iTunes")
#    iMaciTunes.pause if iMaciTunes.is_running?
      
#    say "I just slapped the troubadour's ass"
    
#    request_completed
#  end
  
#  listen_for /Six macbook iTunes play/i do
#    macbookiTunes = Appscript.app.by_url("eppc://SiriAdmin:siritest@192.168.1.7/iTunes")
#    macbookiTunes.play if macbookiTunes.is_running?
      
#    say "I just slapped the troubadour's ass"
    
#    request_completed
#  end
  
#  listen_for /Six macbook iTunes stop/i do
#    macbookiTunes = Appscript.app.by_url("eppc://SiriAdmin:siritest@192.168.1.7/iTunes")
#    macbookiTunes.pause if macbookiTunes.is_running?
      
#    say "I just slapped the troubadour's ass"
    
#    request_completed
#  end
  
  # remote commands using osax language
  
  # to navigate in Mac os spaces
#  listen_for /Six (.*) space/i do |direction|
    
#    if direction == "left"
#        `osascript -e 'tell application "System Events" to keystroke (ASCII character 28) using control down'`
#        say "Switching on previous space." 
    
#    elsif direction == "right"
#        `osascript -e 'tell application "System Events" to keystroke (ASCII character 29) using control down'`
#        say "Switching on next space." 
    
#    elsif direction == "upper"
#        `osascript -e 'tell application "System Events" to keystroke (ASCII character 30) using control down'`
#        say "Switching on upper space." 
#    
#    else direction == "lower"
#        `osascript -e 'tell application "System Events" to keystroke (ASCII character 31) using control down'`
#        say "Switching on lower space." 
#    end
    
#    request_completed
#  end
  
  
  ##############################################################################
  # Six, room lights cmds
  
  #little spot on
##  listen_for /six little spot on/i do
#    say "Switched the little spot on Sir"
    
#    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
#  end
  
  #little spot off
#  listen_for /six little spot off/i do
#    say "The little spot is now off Sir"
    
#    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
#  end
  
  #middle spot on
#  listen_for /six middle spot on/i do
#    say "Middle spot on Sir"
#    
#    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
#  end
  
  #middle spot off
#  listen_for /six middle spot off/i do
#    say "A little bit of privacy... understood, Sir"
    
#    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
#  end
  
  #big spot on
#  listen_for /six big spot on/i do
#    say "Let there be light!"
    
#    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
#  end
  
  #big spot off
#  listen_for /six big spot off/i do
#    say "The darkness for my Lord!"
    
#    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
#  end
  
  
  #outdoor lights on
#  listen_for /six outdoor lights on/i do
 #   say "Switched on the Eiffel View Sir"
    
#    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
#  end
  
  #outdoor lights off
#  listen_for /six no more outdoor lights/i do
#    say "Balcony to sleep mode"
    
#    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
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

