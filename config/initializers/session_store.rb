# encoding : UTF-8

# Be sure to restart your server when you modify this file.

Autodor::Application.config.session_store :cookie_store, :key => '_autodor_session'

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create_truck the session table with "rails generate session_migration")
# Autodor::Application.config.session_store :active_record_store
