require 'crowi'

crowi = Crowi::Client.new(base_url: "<your crowi url>", access_token: "<your access token>")

# Create page
page = crowi.create_page('/sandbox/test', 'new page').body['page']
puts page

page_id = page['_id']
revision_id = page['revision']['_id']

# Get page
puts crowi.page('/sandbox/test').body['page']

# Get pages
puts crowi.pages('/sandbox/').body['pages']

# Update page
crowi.update_page(page_id, 'updated page')

# Add comment
crowi.add_comment(page_id, 'new comment', revision_id)

# Get comments
puts crowi.comments(page_id).body['comments']

# Add attachment
crowi.add_attachment(page_id, '/Users/kishi/Downloads/unity.png', 'image/png')

# Get attachments
puts crowi.attachments(page_id).body['attachments']
