class PlayQueuesController < ApplicationController
  def index
    @play_queues = PlayQueue.all
  end
  def current_song
    
  end
end
