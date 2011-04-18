http    = require 'http'
app     = require('express').createServer()

#Don is used within the views
views   = require('./views/views.js').views 


#Data
myblog =  
    title: "my blog"
    articles: [ {id:123, title:"my article 1", body:"article1 body", link:"#", anchor:"my link1"}
                {id:456, title:"my article 2", body:"article2 body", link:"#", anchor:"my link2"}
                {id:789, title:"my article 3", body:"article3 body", link:"#", anchor:"my link3"}] 

#Route
app.get '/', (req, res) ->    
    res.send views.home(myblog), {'Content-Type': 'text/html'}, 201



app.listen 3000
console.log 'Server running at http://localhost:3000/'
