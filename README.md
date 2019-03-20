Nested Comments using Polymorphic Association


Create rails app and generate model, controller,
```

rails g controller articles
rails g controller comments

# model

rails g model article title:string body:text

# use polymorphic association
rails g model comment body:text commentable:references{polymorphic} 


rake db:migrate

```

Article model like,

```

class Article < ApplicationRecord
  
  has_many :comments, as: :commentable

end


```


Comment model like,
```

class Comment < ApplicationRecord

  belongs_to :commentable, polymorphic: true
  
  has_many :comments, as: :commentable

end


```

then use rails c ,
```

Article.create(title: "this is the elixir title", body: "this is the ruby article")

```

comment on first Article,
```

Article.first.comments.create(body: "this is a comment on elixir article")

```

Nested Comments like,

```

Comment.first.comments.create(body: "this is a elixir article reply comment")

```

Routes are,
```

root 'articles#index'

resources :articles do
  
  resources :comments

end

resources :comments do 
  
  resources :comments

end

```

start rails server,

```

rails s

```

```ruby?line_numbers=false
abhinav 098 nested comments

```






