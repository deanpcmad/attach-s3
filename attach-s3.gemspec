# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'attach/s3/version'

Gem::Specification.new do |spec|
  spec.name          = "attach-s3"
  spec.version       = Attach::S3::VERSION
  spec.authors       = ["Dean Perry"]
  spec.email         = ["dean@voupe.com"]

  spec.summary       = "S3 backend module for the Attach gem"
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/deanpcmad/attach-s3"
  spec.license       = "MIT"

  spec.files         = Dir.glob("{lib}/**/*")
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "attach", ">= 1.0", "< 2.0"
  spec.add_runtime_dependency "aws-sdk", "~> 2"

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
end
