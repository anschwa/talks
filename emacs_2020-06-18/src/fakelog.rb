#!/bin/ruby
# Generate a fake log file that looks interesting
# Such as:
# ~> ruby fakelog.rb 3 | sort --stable --keys"1,1"
# 2020-05-27T11:12:49-04:00 [WARN] [worker 046] [client 254.201.103.230 Mozilla/5.0 (Windows; U; Win 9x 4.90; SG; rv:1.9.2.4) Gecko/20101104 Netscape/9.1.0285] Hacking auxiliary matrix...
# 2020-05-29T13:23:25-04:00 [DEBU] [worker 073] [client 26.175.169.195 Opera/9.80 (X11; Linux i686; Ubuntu/14.10) Presto/2.12.388 Version/12.16] Bypassing neural protocol...
# 2020-05-31T00:56:47-04:00 [ERRO] [worker 021] [client 102.195.202.68 Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko] Error overriding interface

require 'faker'

def log
  status    = ["ERRO", "INFO", "DEBU", "WARN"].sample
  code      = Faker::Number.leading_zero_number(digits: 3)
  ip        = Faker::Internet.ip_v4_address
  useragent = Faker::Internet.user_agent

  date = Faker::Time.between(
    from: DateTime.now - 30,
    to: DateTime.now
  ).iso8601

  msg =
    if status == "ERRO"
      "Error #{Faker::Hacker.ingverb} #{Faker::Hacker.noun}"
    else
      "#{Faker::Hacker.ingverb.capitalize} #{Faker::Hacker.adjective} #{Faker::Hacker.noun}"
    end

  "#{date} [#{status}] [worker #{code}] [client #{ip} #{useragent}] #{msg}"
end

# Output n log lines to stdout
n =
  begin
    Integer(ARGV.first)
  rescue TypeError
    10
  end

n.times { puts log }
