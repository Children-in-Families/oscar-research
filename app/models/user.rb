class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :visits, dependent: :destroy
  has_many :advanced_searches, dependent: :destroy

  ROLES = ['admin', 'guest'].freeze

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :roles, inclusion: { in: ROLES }

  before_create :enable_log_in

  ROLES.each do |role|
    define_method("#{role.parameterize.underscore}?") do
      roles == role
    end
  end

  def active_for_authentication?
    super && enable_research_log_in?
  end

  def name
    full_name = "#{first_name} #{last_name}"
    full_name.present? ? full_name : 'Unknown'
  end

  def oscar_team?
    email == ENV['OSCAR_TEAM_EMAIL']
  end

  private

  def enable_log_in
    self.enable_research_log_in = true
  end
end
