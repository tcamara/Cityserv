class Contact < ActiveRecord::Base

  validates_presence_of :first_name, :last_name

  has_many :notes
  has_and_belongs_to_many :properties

  cattr_reader :per_page
  @@per_page = 50

  def self.search(query)
    if query && query != "" && query != " "
      find(:all, :conditions => ["first_name LIKE ? or last_name LIKE ? or job_title LIKE ? or company_name LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%"], :order => 'first_name')
    end
  end

  def self.parse_it(parameter)
    sort = case parameter
             when "first_name"  then "first_name"
             when "last_name"   then "last_name"
             when "job_title" then "job_title"
             when "company_name" then "company_name"
             when "first_name_reverse"  then "first_name DESC"
             when "last_name_reverse"   then "last_name DESC"
             when "job_title_reverse" then "job_title DESC"
             when "company_name_reverse" then "company_name DESC"
    end
  end

end
