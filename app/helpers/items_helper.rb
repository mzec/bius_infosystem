module ItemsHelper
  def item_form(form)
    render :partial => 'form', :locals => {:f => form}
  end
end
