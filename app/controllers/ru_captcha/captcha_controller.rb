module RuCaptcha
  class CaptchaController < ActionController::Base
    def index
      return head :ok if request.head?
      headers['Cache-Control'] = 'no-cache, no-store, max-age=0, must-revalidate'
      headers['Pragma'] = 'no-cache'
      data = generate_rucaptcha
      opts = { disposition: 'inline', type: 'image/gif' }
      headers['token'] = data.last
      send_data data[1], opts
    end
  end
end
