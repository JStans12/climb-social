class GenerateRefreshToken
  prepend SimpleCommand

  def initialize(email, device)
    @user = User.find_by_email(email)
    @device = device
  end

  def call
    generate_token
  end

  private
  attr_reader :user, :device

    def generate_token
      @user.refresh_token[@device] = refresh_token
      @user.save
      return @user.refresh_token[@device]
    end

    def refresh_token
      loop do
        token = SecureRandom.hex(10)
        break token unless User.where("refresh_token @> :kv", kv: "#{@device} => #{token}").exists?
      end
    end
end
