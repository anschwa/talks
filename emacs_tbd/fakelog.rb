#!/bin/ruby
# Generate a fake log file that looks interesting
# Such as:
# [Wed, May 06 18:23:45-0400 2020] WARN [worker 0466] [client 254.201.103.230 Mozilla/5.0 (Windows; U; Win 9x 4.90; SG; rv:1.9.2.4) Gecko/20101104 Netscape/9.1.0285] hacking port program...
# [Sat, May 16 11:27:38-0400 2020] DEBUG [worker 0734] [client 26.175.169.195 Opera/9.80 (X11; Linux i686; Ubuntu/14.10) Presto/2.12.388 Version/12.16] generating matrix program...
# [Fri, Apr 24 18:16:41-0400 2020] ERROR [worker 0218] [client 102.195.202.68 Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko] error overriding interface

require 'faker'

def log
  level = status()

  if level == "ERROR"
    prefix = "error"
  else
    postfix = "#{Faker::Hacker.noun}..."
  end

  "[#{datetime}] #{level} [worker #{num}] [client #{ip} #{useragent}] #{prefix} #{err_msg} #{postfix}"
end

def datetime
  Faker::Time.between(
    from: DateTime.now - 30,
    to: DateTime.now
  ).strftime("%a, %b %e %H:%M:%S%z %Y")
end

def status
  ["ERROR", "INFO", "DEBUG", "WARN"].sample
end

def num
  Faker::Number.leading_zero_number(digits: 4)
end

def ip
  Faker::Internet.ip_v4_address
end

def err_msg
  "#{Faker::Hacker.ingverb} #{Faker::Hacker.noun}"
end

def useragent
  Faker::Internet.user_agent
end

10.times { puts log }
