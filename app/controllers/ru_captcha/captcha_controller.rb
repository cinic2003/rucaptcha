module RuCaptcha
  class CaptchaController < ActionController::Base
    def index
      return head :ok if request.head?
      headers['Cache-Control'] = 'no-cache, no-store, max-age=0, must-revalidate'
      headers['Pragma'] = 'no-cache'
      data = generate_rucaptcha
      opts = { disposition: 'inline', type: 'image/gif' }
      headers['token'] = data.last
      render json: {token: data.last, data: Base64.encode64(data[1])}
    end
  end
end
