#!/usr/bin/env ruby
require 'twitter'
	# quelques lignes qui enregistrent les clés d'APIs
	client = Twitter::Streaming::Client.new do |config|
		config.consumer_key        = ""
		config.consumer_secret     = ""
		config.access_token        = ""
		config.access_token_secret = ""
end
	#on rentre les mots clés qui filtrent les tweet en temps réel, puis on put les twitt
	topics = ["coffee", "tea"]
	client.filter(track: topics.join(",")) do |object|
	puts object.text if object.is_a?(Twitter::Tweet)
end
