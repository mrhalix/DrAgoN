do

function run(msg, matches)

local fuse = '#feedback \n\n🌐آیدی : ' .. msg.from.id .. '\n\n🅿یوزر نیم: @' .. msg.from.username .. '\n️\nⓂ️اسم : ' .. msg.from.print_name ..'\n\n🔰متن پیام :\n\n\n' .. matches[1] 
local fuses = '!printf user#id' .. msg.from.id


    local text = matches[1]
 bannedidone = string.find(msg.from.id, '000000000')
        bannedidtwo =string.find(msg.from.id, '000000000')       
   bannedidthree =string.find(msg.from.id, '000000000')  


        print(msg.to.id)

        if bannedidone or bannedidtwo or bannedidthree then                    --for banned people
                return 'You are banned to send a feedback'
	else


                 
                 local sends0 = send_msg('chat#id75744575', fuse, ok_cb, false)

 return ' ✅فرستاده شد '

     

end

end
return {
  description = "Feedback",

  usage = "!feedback message",
  patterns = {
    "^[!/$&-=+:*.%#?@][Ff]eedback (.*)$",
        "^[Ff]eedback (.*)$"

  },
  run = run
}

end


