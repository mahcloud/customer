# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Customer::Application.config.secret_key_base = '3bee7f97dd3536c26c4b28261a94dd40492f78b1a087ae31afb81c17965060da50d654be53ed56d4d14346b36e2498a405c3066d0b63df75c51b036742221014'