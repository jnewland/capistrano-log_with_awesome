#you can use capistrano's built-in :exit callback, however this will not be triggered
#when a task encounters an exception during execution. If you want to upload the log 
#regardless of whether the task completed successfully or not then you must use Kernal#at_exit
at_exit do
  put full_log, "#{deploy_to}/deploy.log"
end