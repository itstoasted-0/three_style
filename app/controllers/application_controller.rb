class ApplicationController < ActionController::Base
  before_action :set_search
  protect_from_forgery with: :exception
  include SessionsHelper

  # フィードから検索条件に該当する投稿を検索
  def set_search
    if logged_in?
      @search_word = params[:q][:content_or_user_name_cont] if params[:q]
      @q = current_user.feed.paginate(page: params[:page], per_page: 5).ransack(params[:q])
      @posts = @q.result(distinct: true)
    end
  end


  private
    #ログイン済ユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインしてください"
        redirect_to login_url
        #redirect_to login_url, alert: "ログインして下さい"
      end
    end

end