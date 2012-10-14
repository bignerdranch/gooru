# Gooru

The gooru gem allows your Ruby app to talk to the [Gooru API](http://developers.goorulearning.org)

## Installation

Add this line to your application's Gemfile:

    gem 'gooru'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gooru
    
## Setup

### Gooru API key

Some areas of the Gooru API require sign in via an API key.

You may want to [request an API key](http://developers.goorulearning.org/request-a-key) from Gooru before you get started.

### Environment variables

If you're using an API key, you may want to store it in an environment variable.

Environment variables can be a way to store sensitive data you don't want in source control.

Consider using a tool like [Dotenv](https://github.com/bkeepers/dotenv) to manage these variables across different developer and server environments.

You'll see the environment variable approach used in the examples below.

## Usage

### Sign In

The Sign In call takes your API key and returns a session token.

If you're using the signed in areas of the Gooru API, you'll need to hang on to the returned session token and use it in later requests.

The Sign In call is not needed if you're only using the public areas of the API.

    response = Gooru::SignIn.post(
      apiKey:   ENV["GOORU_API_KEY"],
      userName: ENV["GOORU_USER_NAME"],
      password: ENV["GOORU_PASSWORD"])
      
    if response.success?
      puts "You've been authenticated!"
      puts "Your session token is #{response.data['token']}"
    else
      puts "You were unable to be authenticated…"
      puts "The error message was: #{response.data['error']}"
    end
    
*Required parameters*

* `apiKey`
* `userName`
* `password`

### Resources

The Resources call takes a query and returns a list of matching resources.

You can optionally pass a session token if you're signed in, but it is not required.

    response = Gooru::Resources.get(
      query: "algebra")
      
    if response.success?
      results = response.data["searchResults"]
      puts "We found #{results.length} resources matching 'algebra'"
    else
      puts "The error message was: #{response.data['error']}"
    end    

*Required parameters*

* `query`

*Optional parameters*

* `sessionToken`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
