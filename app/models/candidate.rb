require 'digest/sha1'

class Candidate < ActiveRecord::Base
  before_create :make_token

  validates_presence_of :name
  validates_length_of :name, :maximum => 100
  
  validates_presence_of :email
  validates_length_of :email, :within => 6..100
  validates_uniqueness_of :email
  validates_format_of :email, :with => Authentication.email_regex, :message => Authentication.bad_email_message

  default_scope :order => "created_at DESC"

  liquid_methods :name

  def state
    case
    when hunt_started_at.nil?
      :not_started
    when hunt_started_at >= self.class.hunt_length.ago
      :started
    when hunt_started_at < self.class.hunt_length.ago
      :finished
    end
  end

  def start!
    self.hunt_started_at = Time.now
    save!
  end

  def reset!
    self.hunt_started_at = nil
    save!
  end

  # Returns the time when the candidate's hunt will end.  If the candidate has not yet
  # started a hunt, returns nil.
  def hunt_end_time
    self.hunt_started_at.nil? ? 0 : self.hunt_started_at + self.class.hunt_length
  end

  # page size for will_paginate
  def self.per_page
    30
  end

  private
  # taken from restful_authentication/lib/authentication.rb
  def self.secure_digest(*args)
    Digest::SHA1.hexdigest(args.flatten.join('--'))
  end

  def self.make_token
    secure_digest(Time.now, (1..10).map { rand.to_s })
  end

  def make_token
    self.token = self.class.make_token
  end

  def self.hunt_length
    1000000.minutes
  end
end
