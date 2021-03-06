class Api::V1::ConversationsController < ApiController

	def index
    conversations = Conversation.all
    render json: conversations
  end

  def create
    conversation = Conversation.new(conversation_params)
    if conversation.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        ConversationSerializer.new(conversation)
      ).serializable_hash
      ActionCable.server.broadcast 'conversations_channel', serialized_data
      render json: serialized_data
    end
  end
  
  private
  
  def conversation_params
    params.require(:conversation).permit(:title)
  end

end
