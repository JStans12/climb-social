class RefreshUser
  prepend SimpleCommand

  def initialize(refresh_token, device)
    @refresh_token = refresh_token
    @device = device
  end

  def call
    find_user
    tokens = {}
    tokens[:auth]    = JsonWebToken.encode(user_id: @user.id) if @user
    tokens[:refresh] = GenerateRefreshToken.call(@user.email, device).result
    return tokens
  end

  private
  attr_reader :refresh_token, :device

    def find_user
      @user = User.where("refresh_token @> :kv", kv: "#{@device} => #{@refresh_token}")[0]
      return @user if @user
      errors.add :user_authentication, 'invalid refresh token'
      nil
    end
end
