class Avatar < ApplicationRecord
  belongs_to :user

  # Default is light
  enum skin_type: %i[
    light yellow pale dark_brown black
  ]
  # Default is dot eyes (neutral)
  enum eye_type: %i[
    neutral closed blinking happy cry
    dizzy angry tired
  ]
  # Default is softpointy nose
  enum nose_type: %i[
    softpointy rounded pointy
  ]
  # Default is without hair (bald)
  enum hair_type: %i[
    bald short_1 short_2 short_3 short_4
    short_5 short_6 short_7 short_8 short_9
    short_10 short_11 short_12 short_13 long_1
    long_2 long_3 long_4 long_5 long_6 long_7
    long_8 long_9 long_10 long_11 long_12 long_13
  ]
  # Default is without facial hair
  enum facial_hair_type: %i[
    no_facial_hair short_beard medium_beard
    large_beard huge_beard long_beard
    moustache_chevron moustache_horseshoe
    moustache_handlebar
  ]
  # Default is t-shirt
  enum clothing_type: %i[
    t_shirt t_shirt_v_neck
    t_shirt_crew_neck shirt
    hoodie sweater turtle_neck
  ]
  # Default is without head acessory
  enum head_accessory_type: %i[
    no_head_accessory hat hijab
    turban cap winter_cap
  ]
  # Default is without face acessory
  enum face_accessory_type: %i[
    no_face_accessory glasses_1
    glasses_2 glasses_3
  ]

  COLORS = {
    # Basic Colors
    white:        '#FFFFFF',
    black:        '#000000',
    blue:         '#2384F5',
    yellow:       '#FFCA00',
    green:        '#80C43B',
    red:          '#FB344F',
    pink:         '#FF64C8',
    purple:       '#AE0BFF',
    gray:         '#DBDBE6',
    brown:        '#9B5921',
    # Light Colors
    light_blue:   '#9BC5FF',
    light_yellow: '#FFEA99',
    light_green:  '#C2E3A1',
    light_red:    '#FD9DAA',
    light_pink:   '#FFC1E9',
    light_purple: '#E5B1FF',
    light_gray:   '#F5F5F8',
    # Dark Colors
    dark_blue:    '#000066',
    dark_brown:   '#6A2405',
    dark_gray:    '#9292B3',
    # Other
    golden:       '#FFCA00',
    blonde:       '#FFDC78'
  }
end
