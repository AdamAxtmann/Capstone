class Phr < ActiveRecord::Base
	belongs_to :user
	has_many :eyes, dependent: :destroy
	has_many :immunizations, dependent: :destroy
	has_many :allergies, dependent: :destroy
	has_many :appointments, dependent: :destroy
	has_many :dentals, dependent: :destroy
	has_many :ailments, dependent: :destroy
	has_many :tests, dependent: :destroy
	default_scope -> { order('created_at DESC') }
	before_save { self.blood_type = blood_type.downcase }
	validates :first_name, presence: true, length: { maximum: 50 }
	validates :last_name, presence: true, length: { maximum: 50 }
	validates :date_of_birth, presence: true
	validates :gender, presence: true, length: { maximum: 10 }
	VALID_BLOOD_REGEX = /\A^(A|B|AB|O)[+-]$\z/i
	validates :blood_type, presence: true, format: { with: VALID_BLOOD_REGEX }
	validates :health_card_no, presence: true, length: { maximum: 50 }
	validates :user_id, presence: true
end
