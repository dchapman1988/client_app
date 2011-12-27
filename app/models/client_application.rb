class ClientApplication < ActiveRecord::Base

  validates_presence_of :email, :business_name
  validates_format_of :email, :with => /(\S+)@(\w+.\w+)/
  attr_accessor :area_code,:phone_first,:phone_last
  validates_format_of :area_code, :with => /[0-9]{3}/
  validates_format_of :phone_first, :with => /[0-9]{3}/
  validates_format_of :phone_last, :with => /[0-9]{4}/
  before_save :make_phone

  belongs_to :user
  has_one :united_state
  has_many :attachments, :dependent => :destroy
  has_many :principal_information_forms, :dependent => :destroy
  has_many :banking_information_forms, :dependent => :destroy
  accepts_nested_attributes_for :attachments, :allow_destroy => true
  accepts_nested_attributes_for :principal_information_forms, :allow_destroy => true
  accepts_nested_attributes_for :banking_information_forms, :allow_destroy => true

  has_attached_file :articles_of_incorporation
  has_attached_file :proof_of_insurance
  has_attached_file :business_license
  has_attached_file :partnership_agreement
  has_attached_file :limited_partnership
  has_attached_file :charter
  has_attached_file :association_resolution
  has_attached_file :irs_tax_exempt_status_form
  has_attached_file :bank_statement
  has_attached_file :tax_return_one
  has_attached_file :tax_return_two
  has_attached_file :litigation

  state_machine :state, :initial => :blank do
    after_transition :blank => :submitted, :do => :after_submit
    after_transition :submitted => :requested, :do => :after_request
    after_transition :requested => :responded, :do => :after_respond
    after_transition :responded => :completed, :do => :after_complete

    event :submit do
      transition [:blank] => :submitted
    end

    event :requesting do
      transition [:submitted] => :requested
    end

    event :respond do
      transition [:requested] => :responded
    end

    event :complete do
      transition [:responded] => :completed
    end

    state :blank
    state :submitted
    state :requested
    state :responded
    state :completed
  end

  def after_submit
    Client.client_email(self).deliver
  end

  def after_request
    Client.client_email(self).deliver
  end

  def after_respond
    Client.client_email(self).deliver
  end

  def after_complete
    Client.client_email(self).deliver
  end

  def make_phone
    self.phone_number = @area_code + "-" + @phone_first + "-" +  @phone_last
  end

end
