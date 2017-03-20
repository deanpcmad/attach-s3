require 'fileutils'
require 'attach/backends/abstract'
require 'aws-sdk'

module Attach
  module S3
    class Backend < Attach::Backends::Abstract

      def read(attachment)
        s3 = setup_s3_request
        path = path_for_attachment(attachment)

        resp = s3.bucket(@config[:bucket]).object(path).get
        resp.body.read
      end

      def write(attachment, data)
        s3 = setup_s3_request
        path = path_for_attachment(attachment)

        s3.bucket(@config[:bucket]).object(path).put(body: attachment.binary)
      end

      def delete(attachment)
        s3 = setup_s3_request
        path = path_for_attachment(attachment)

        s3.bucket(@config[:bucket]).object(path).delete
      end

      private

      def setup_s3_request
        Aws.config.update({
          region: @config[:region],
          credentials: Aws::Credentials.new(@config[:access_key], @config[:secret_access_key])
        })

        Aws::S3::Resource.new
      end

      def path_for_attachment(attachment)
        ::File.join("attachments", attachment.token[0,2], attachment.token[2,2], attachment.token[4,40], attachment.file_name)
      end

    end
  end
end
