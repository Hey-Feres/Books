class UserController < ApplicationController
  def profile
  end

  def edit
    @user = current_user
    @avatar = @user.avatar

    # @avatar_options = {
    #   bodies: load_avatar_options_for(:body)
    # }
  end

  def load_avatar_options_for avatar_piece
    # byebug
    raise "Invalid Avatar Piece" unless %i[body].include? avatar_piece
    
    # Dir[image_path("/avatar/body/*.svg")]
    # Dir["./images/avatar/#{avatar_piece.to_s}/*.svg"]
  end
end
