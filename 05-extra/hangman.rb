require_relative 'dictionary'
require_relative 'player'
require_relative 'IAplayer'
require_relative 'game'


new_game = Game.new

system("clear")
 new_game.start_game

#puts new_game.word_to_forever_alone