module Docomoru
  module DialogueMethods
    PATH = "/naturalChatting/v1/dialogue"

    def request_time
      Time.now.to_s.tap { |str| str.slice!(" +0900") }
    end

    def create_dialogue(message, params = {}, headers = {})
      post(
        "#{PATH}?#{default_query_string}",
        params.merge(
          language: "ja-JP",
          botId: "Chatting",
          appId: ENV["DOCOMO_APP_ID"],
          voiceText: message,
          appRecvTime:"",
          appSendTime:"#{request_time}"
        ),
        headers,
      )
    end
  end
end
