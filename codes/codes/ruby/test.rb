#!/home/khankens/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

items = `ls`

items.split(/\n/).each do |item|
  puts `echo I like #{item} \n`
end
