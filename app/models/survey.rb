class Survey < ActiveRecord::Base
  #=====================> assignments
  attr_protected  :inbox_id, :is_published, :panels_count, :is_gift, :is_duplicating, :gift_count
  attr_protected :name, :gift_code, :tag_color

  #=====================> associations

  #default_scope { where( inbox_id: Inbox.current_id ) if Inbox.current_id }
  #default_scope { where("is_deleted IS NOT true") }
  #default_scope { where("is_duplicating IS NOT true") }

  belongs_to :inbox

  #has_one  :design,           :dependent => :destroy,   :inverse_of => :survey

  #has_one  :questionnaire,    :dependent => :destroy,   :inverse_of => :survey
  #has_many :questions,        :through   => :questionnaire

  #has_many :collectors,       :dependent => :destroy
  has_many :segments,         :dependent => :destroy
  #has_many :creatives,        :dependent => :destroy
  #has_many :panels,           :dependent => :destroy
end