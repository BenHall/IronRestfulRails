# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_IronRestfulRails_session',
  :secret      => 'd664fb7e3af458bae31fa9b200ae8ef1329a564a7935de303488aab8cd568ac0ab5f298f2a9ab4ed8119164d3e923fb327f6918075a0230832a997760bb35361'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
