class BlockByBlocksUrl
  def reset_password_url(token)
    "#{self.root_url}/reset-password/#{token}"
  end

  private
    def self.root_url
      if Rails.env.development?
        'http://localhost:4939' # does this work with rando-port?
      else
        'https://blockbyblocks.com'
      end
    end
end
