# require 'airborne'

# RSpec.describe 'API' do

#   before(:all) do
#     WebMock.allow_net_connect!

#     post 'https://rest.prde.immedia-semi.com/login', { 
#       email: 'steveyblam@hotmail.co.uk',
#       password: 'root55561' 
#     }

#     @login_response = json_body
#     @token = json_body[:authtoken][:authtoken]
#   end

#   it 'should validate login request' do
#     post 'https://rest.prde.immedia-semi.com/login', { 
#       email: 'steveyblam@hotmail.co.uk',
#       password: 'root55561' 
#     }
#     expect_json_types(authtoken: {authtoken: :string , message: :string})
#   end

#   it 'should validate networks request' do

#     get 'https://rest.prde.immedia-semi.com/networks',{
#       TOKEN_AUTH: @token
#     }
#     expect_json_types(
#       'networks.*', id: :integer, name: :string, description: :string, armed: :boolean
#     )
#   end
# end
