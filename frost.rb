require 'discordrb'
require 'cleverbot'

user = 'CLEVERBOT.IO API USER'
key = 'CLEVERBOT.IO API KEY'

frost = Cleverbot.new(user, key, 'frost.rb')

bot = Discordrb::Bot.new token: 'B0T.T0KEN.here', client_id: 12345678901234

bot.ready do |_|
  puts "Logged in as #{bot.profile.username} (ID:#{bot.profile.id})"
  bot.game = 'chat with me!'
end

bot.message do |event|
  if event.message.content.include?("<@#{bot.profile.id}>") || event.message.content.include?("<@#{bot.profile.id}>")
    event.channel.start_typing
    event.respond(frost.say(event.message.content.gsub("<@#{bot.profile.id}>", '').gsub("<@!#{bot.profile.id}>", '')))
  end
end

bot.run
