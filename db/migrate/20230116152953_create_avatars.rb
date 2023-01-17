class CreateAvatars < ActiveRecord::Migration[5.2]
  def change
    create_table :avatars do |t|
      t.references :user, foreign_key: true
      # Skin
      t.integer :skin_type
      # Mouth
      t.string :mouth_type
      # Eye
      t.integer :eye_type
      t.string :eye_color
      # Nose
      t.integer :nose_type
      # Hair
      t.integer :hair_type
      t.string :hair_color
      # Facial Hair
      t.integer :facial_hair_type
      t.string :facial_hair_color
      # Clothing
      t.integer :clothing_type
      t.string :clothing_color
      # Head Accessory
      t.integer :head_accessory_type
      t.string :head_accessory_color
      # Face Accessory
      t.integer :face_accessory_type
      t.string :face_accessory_color

      t.timestamps
    end
  end
end
