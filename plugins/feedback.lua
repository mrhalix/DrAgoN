do

function run(msg, matches)

local fuse = '#newfeedback \n\nid : ' .. msg.from.id .. '\n\nName : ' .. msg.from.print_name ..'\n\nLetters :\n\n\n' .. matches[1] 
local fuses = '!printf user#id' .. msg.from.id



        print(msg.to.id)

        


                 local sends0 = send_msg('chat#id75744575', fuse, ok_cb, false)

 return 'Sent !'

     

end

end
return {
  description = "Feedback",

  usage = "!feedback message",
  patterns = {
    "^![Ff]eedback (.*)$"

  },
  run = run
}

end

