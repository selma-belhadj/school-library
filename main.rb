require './app'
require 'json'

initialize_files

def main
  app = App.new
  app.start_console
end

main
