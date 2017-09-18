module ApplicationHelper
  def controller?(controller)
    # 引数が現在のコントローラーと一致したらTrue
    controller.include?(params[:controller])
  end

  def action?(action)
    action.include?(params[:action])
  end
end
