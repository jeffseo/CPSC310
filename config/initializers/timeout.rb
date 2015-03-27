# Any request that continue for 20 seconds will be terminated and a stack trace output to the logs.
Rack::Timeout.timeout = 20 #seconds