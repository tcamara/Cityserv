# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_cityserv_session',
  :secret      => 'd5dd2a86a19c25d0cafd2ef3bdc98cd0b4e39b379b8564c0a0b0538e909d9c3d1f5d1cf0566c6fc29bbda82fd385be0267f8cf0762f51eaddcd733d1d46e668e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
