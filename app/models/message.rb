class Message < ActiveRecord::Base
  validates :content, :author, presence: true
  validate :url_checker, if: :url

  def url_checker
    errors.add(:invalid_url, ": url is invalid") unless url =~ URI::regexp
  end
end
