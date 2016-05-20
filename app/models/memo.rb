class Memo < ActiveRecord::Base

  belongs_to :user
  
  
  validates :title, presence: true, length: {minimum: 2, maximum: 50}
  validates :url, presence: true,  length: {minimum: 5, maximum:800}
  validates :url, format: { with: URI.regexp }, if: Proc.new { |a| a.url.present? }
  validates :user_id, presence: true
  
 
  

  
  
end