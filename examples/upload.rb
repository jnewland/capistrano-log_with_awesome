on :exit do
  put full_log, "#{deploy_to}/deploy.log"
end