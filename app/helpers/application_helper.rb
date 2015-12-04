module ApplicationHelper

  def tr_class(q)
    if current_user.questions.include? q
      'success'
    else
      ''
    end
  end
end
