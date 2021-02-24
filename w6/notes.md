Server is software or code that listens for requests and serves up a response or does somethign with those requests

HTTP Verbs
    -get
    -post


HTTP request line
    -Verb
        get/post
    -Path
    -Query sting


CRUD -again this time for http
    create
    read
    update
    delete

REST - web architecture to access
    representational
    state
    transfer

    rest is an agreed upon web archtecture that creates a sense of predictability
        if I send a request called users I am most likey going to want to find info about the users


Website -Human readable
    a website
Webservice - machine readable -API - write code to interact with
    json
    CSV
    xml
    yaml

these routes can't co-exist because the path won't know which it's referring to
GET /users/:id
GET /users/:username
    they will confuse the controller

instead
GET /users/search/:username


422 -messed up form -unprocessable entity

router is created and destroyed with each request

PARAMS - info given to us by the request in order to perform the action -these come from the HTTP request 
    params is a ruby object that rails creates automatically
3ways to pass params into an http request
    use wild cards ie /users/:id
        -: signifies a wildcard
        -when the wildcard info gets placed inside params the key becomes whatever is after the colon in this case the key is :id=>value

    query string /path?param1=value&param2=value2 #key value pairs param1=>value

    request body
        should avoid for get requests


routes is in config
    defining route without resources
        http_method 'path', to: 'controller#action'
        IE get /users, to: 'users#index'   #go to users controller and invoke index action. Actions are instance methods
    

bundle exec rails routes
    shows all the routes that your router can respond too

    can add a -c flag to show specific routes
    -bundle exec rails routes -c users (shows routes related to users)
    

bundle exec rails s
    -starts local rails server on localhost:3000

controllers names are imporatant
    has to be plural
    has to be _controller
    class is plural
    inherit from ApplicationController
        you should have access to all the model code within the controller

    !!!!every action of a controller has to either redirect or render and can only do it once
        render and redirect are similar but slightly different

    if you make it singular not plural you get an error, unable to autoload something. it is a 500 level error

JSON
    javascript object notation
    render json: users turns users into a javascript object


you can look at the network tabin chrome developer tools and see what the request/response is


to create a new route
    go to routes.rb
        -get /users/:id, to: 'users#show'  #resources does index, new, create, show, edit, update, destroy by default the other method is useful for custom routes
        -resources :users
    get the controller action
        go to the controller
            users_controller
    write method in controller class
            -:id is the wild card that passes in the params
        def show        #give one specific user
            user = User.find_by(params[:id])

            render json: user
        end


    if you put a debugger in a controller you will hit the debugger in the server log (terminal window running the server process)

Rails has built in requirements for authenticity tokens for anything besides get requests
    -to turn off (probably not a good idea later)
        - add this line to application_controller.rb
            skip_before_action :verify_authenticity_token

if not valid in create
    render json: <whatever_is_the_variable>.errors.full_messages, status: 422
    -if you don't provide status it defaults to 200, so specify it.

    username: 'Jug', email: 'Jug@cats.io', age: '99',  political_affiliation: 'Unplugging Computers'


rediect_to only lets you redirect to a get request


