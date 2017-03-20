# Attach S3

This gem adds a backend for using Amazon S3 with Adam Cooke's
[Attach](https://github.com/adamcooke/attach) gem.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'attach-s3'
```

Once included and installed, you'll need to run through the install basics on
Adam's [Attach](https://github.com/adamcooke/attach) gem page.



## Usage

Create an initializer file at `config/initializers/attach.rb` and enter the
following, setting the correct details:

```ruby
Attach.backend = Attach::S3::Backend.new(
  access_key: "abc123",
  secret_access_key: "123abc",
  region: "eu-west-1",
  bucket: "my-bucket"
)
```

Once you've added that, start your Rails server and you should be able to view,
upload and delete attachments stored on S3!


## To Do

- Public / private uploads
- Better error handling
- Tests
