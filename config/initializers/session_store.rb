# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bughunt_session',
  :secret      => '0b2c9b20f7ce1bd238c53770002adb23e18e086b147d50389a34e9b5c7d8da4ea052e71b752fbbbeba2bad37ac80bd3d20bf5a29ee8e03d7e406d70cf8ec375d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
