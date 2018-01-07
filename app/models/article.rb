class Article < ApplicationRecord

validates :title, presence: true,
                    length: { minimum: 5 }


def how_to

   "I'm checking" + self.text + "field"

end	


def self.build_json_article_list(start_at,length)
	article_array = []
	Article.offset(start_at).limit(length).each do |article|
	article_array << {title: article.title,text: article.text}
	end
	article_array
end

def self.create_article(article_params)
   error_flag = false
   article = Article.new(article_params)
   unless article.save
     error_flag = true
   end
    return error_flag, article
end	


end
