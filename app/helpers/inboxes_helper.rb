# encoding: utf-8

module InboxesHelper
  # base =============================================>
  def free_plan?
    roles.first.name == "free" || roles.first.name == "white"
  end

  def light_blue_plan?
    roles.first.name == "light_blue" || roles.first.name == "light_blue_annual"
  end

  def blue_plan?
    roles.first.name == "blue" || roles.first.name == "blue_annual"
  end

  def navy_plan?
    roles.first.name == "navy" || roles.first.name == "navy_annual"
  end

  def ultramarine_plan?
    roles.first.name == "ultramarine" || roles.first.name == "ultramarine_annual" || roles.first.name == "black" || roles.first.name == "loss_time"
  end

  # grade ===========================================> 

  def light_blue_and_more
    case
      when free_plan?
        false
      when light_blue_plan?
        true
      when blue_plan?
        true
      when navy_plan?
        true
      when ultramarine_plan?
        true
      else
        false
    end
  end

  def light_blue_and_less
    case
      when free_plan?
        true
      when light_blue_plan?
        true
      when blue_plan?
        false
      when navy_plan?
        false
      when ultramarine_plan?
        false
      else
        true
    end
  end

  def blue_and_more
    case
      when free_plan?
        false
      when light_blue_plan?
        false
      when blue_plan?
        true
      when navy_plan?
        true
      when ultramarine_plan?
        true
      else
        false
    end
  end

  def navy_and_more
    case
      when free_plan?
        false
      when light_blue_plan?
        false
      when blue_plan?
        false
      when navy_plan?
        true
      when ultramarine_plan?
        true
      else
        false
    end
  end

  # feature ===========================================>
  # based on https://s3-ap-northeast-1.amazonaws.com/storage-creativesurvey/pdf/plan_table20130917.pdf

  # inboxes

  def answer_limit
    case
      when free_plan?
        30
      when light_blue_plan?
        100
      when blue_plan?
        100000 # 無制限だがとりあえず10万に制限しておく
      when navy_plan?
        100000
      when ultramarine_plan?
        100000
      else
        0
    end
  end

  def is_answer_limited?
    answer_limit < 10000
  end

  alias with_trademark? light_blue_and_less

  alias force_billboard? light_blue_and_less

  alias can_replicate? light_blue_and_more

  alias can_publish_gift_code? blue_and_more

  alias can_invite? navy_and_more

  def share_limit
    case
      when free_plan?
        0
      when light_blue_plan?
        0
      when blue_plan?
        0
      when navy_plan?
        (3-1) # 自分を含めて
      when ultramarine_plan?
        (10-1)
      else
        0
    end
  end

  # 画像容量
  def storage_limit
    case
      when free_plan?
        10485760
      when light_blue_plan?
        104857600
      when blue_plan?
        10737418240 # 無制限だが10GBの制限
      when navy_plan?
        10737418240
      when ultramarine_plan?
        10737418240
      else
        10485760
    end
  end

  # questionnaires

  alias can_set_logic? light_blue_and_more

  alias can_set_redirect? blue_and_more

  alias can_set_randomizer? blue_and_more

  # collectors

  alias can_set_is_due? light_blue_and_more

  alias can_set_is_answer_limit? light_blue_and_more

  alias can_set_can_return? light_blue_and_more

  alias can_set_is_compact? light_blue_and_more

  alias can_set_is_password? blue_and_more

  alias can_set_is_mail? blue_and_more

  alias multiple_collectors? blue_and_more

  # segments

  alias
  can_download_graph? light_blue_and_more

  alias can_download_raw_data? blue_and_more

  alias can_edit_segment? blue_and_more

end
