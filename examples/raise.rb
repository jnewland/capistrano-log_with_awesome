on :log_message do
  # Raise an exception and halt the deploy if you're on an ATT 3G card
  raise Exception if message =~ /mycingular/
end