class Document < ActiveRecord::Base
  belongs_to :user

#set up "uploaded_file" field as attached_file (using Paperclip) 
has_attached_file :uploaded_file, 
                  :url => "/documents/get/:id", 
                  :path => ":Rails_root/documents/:id/:basename.:extension"
  
validates_attachment_size :uploaded_file, :less_than => 2.megabytes   
validates_attachment_presence :uploaded_file
validates_attachment_content_type :uploaded_file, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif", "application/pdf"]
has_attached_file :uploaded_file, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

def file_name 
    uploaded_file_file_name 
end

end
