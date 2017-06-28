module Crowi
  module ApiMethods
    def page(path)
      get('/_api/pages.get', { path: path })
    end

    def pages(path = nil, user = nil, offset = 0)
      raise 'path or user is required' unless path || user
      get('/_api/pages.list', { path: path, user: user, offset: offset })
    end

    def create_page(path, body)
      post('/_api/pages.create', { path: path, body: body })
    end

    def update_page(page_id, body)
      post('/_api/pages.update', { page_id: page_id, body: body })
    end

    def comments(page_id)
      get('/_api/comments.get', { page_id: page_id })
    end

    def add_comment(page_id, comment, revision_id)
      post('/_api/comments.add', { commentForm: {  page_id: page_id, comment: comment, revision_id: revision_id } })
    end

    def attachments(page_id)
      get('/_api/attachments.list', { page_id: page_id })
    end

    def add_attachment(page_id, filename, content_type)
      # To use multipart/form-data use faraday directly
      connection = Faraday.new(faraday_options) do |connection|
        connection.request :multipart
        connection.request :url_encoded
        connection.adapter :net_http
      end

      params = { page_id: page_id, file: Faraday::UploadIO.new(filename, content_type), access_token: @access_token }
      Crowi::Response.new(connection.send(:post, '/_api/attachments.add', params))
    end
  end
end
