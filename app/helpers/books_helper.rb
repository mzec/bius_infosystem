module BooksHelper
  def book_form(form)
    render :partial => 'form', :locals => {:f => form}
  end
end