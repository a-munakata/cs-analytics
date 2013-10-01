# encoding: utf-8

require 'erb'

class Segment < ActiveRecord::Base
  #=====================> assignments

  attr_accessor   :source, :_survey, :_panels, :_questions
  #attr_protected :inbox_id, :survey_id, :unique_id
  attr_accessible :name, :due_end, :due_start,
                  :is_uncompleted, :is_making, :make_at, :is_raw_data_error, :raw_data_error,
                  :disallow_duplicate_ip,
                  :allow_screen_out, :pass_phrase, :is_public,
                  :segment_filters_attributes, :collector_segment_chains_attributes

  #=====================> associations
  default_scope { where( inbox_id: Inbox.current_id ) if Inbox.current_id }

  belongs_to  :survey


end
