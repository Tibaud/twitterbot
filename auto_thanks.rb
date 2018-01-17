#!/usr/bin/env ruby
require 'Twitter'
config =
	{
	consumer_key:        '',
	consumer_secret:     '',
	access_token:        '',
	access_token_secret: ''
	}
#Mettre son Username pour ne pas s'auto remercier :)
me = ''
Thread.new do
  loop do
    begin
      rClient = Twitter::REST::Client.new config
      sClient = Twitter::Streaming::Client.new(config)
      sClient.user do |object|
	#Si une nouvelle personne vous suit
        if object.is_a? Twitter::Streaming::Event and object.name==:follow
          user = object.source
          if user.name != me
            rClient.create_direct_message user, "Merci de me suivre #{user.name} :)"
            puts "Nouveau follower : #{object.source.name}"
          end
        end
      end

    rescue
      puts 'error occurred, sleeping for 5 seconds'
      sleep 5
    end
  end
end
