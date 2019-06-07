require 'pg'

feature 'users can sign up to use chitter' do
  scenario 'user enters name and this is recorded in db' do
    connection = PG.connect(dbname: 'chitter_manager_test')
    visit('/')
    click_button "Click here to sign up!"
    visit('/sign_up')
    fill_in :username, with: 'Jan'
    click_on :Submit
    query = connection.exec("SELECT name FROM users;")
    expect(query.values[0]).to eq(['Jan'])
  end
end