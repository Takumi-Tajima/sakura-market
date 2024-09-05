# TODO: テスト用のcontrollerなのであとで消す
class HelloController < ApplicationController
  before_action :authenticate_admin!

  def index
  end
end
