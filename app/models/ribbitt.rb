class Ribbitt < ActiveRecord::Base
  default_scope { order('created_at DESC') }

  belongs_to :user

  validate :content, length: {maximum: 140}

end
