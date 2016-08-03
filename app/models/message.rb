#modified code from https://matharvard.ca/posts/2014/jan/11/contact-form-in-rails-4/[Accessed,26th June 2016]
#@author Mat Harvard 
class Message

  include ActiveModel::Model
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :name, :email, :content

  validates :name,
    presence: true

  validates :email,
    presence: true

  validates :content,
    presence: true

end