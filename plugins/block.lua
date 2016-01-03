do

local function block_user_callback(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local user = 'user#id'..result.id
  if success == 0 then
    return send_large_msg(receiver, "عملیات بلاک شکست خورد ممکن است آیدی را اشتباه وارد کرده باشید دوباره چک کنید!!")
  end
  block_user(user, cb_ok, false)
end
end
local function run(msg, matches)
 if msg.to.type == 'chat' then
    local user = 'chat#id'..msg.to.id
 local user = matches[2]
  if matches[1] == "user" then
      user = 'user#id'..user
      block_user(user, callback, false)
    end
    if not is_sudo(msg) then
    return "مشکلی داری باهاش؟ اگه داری بگو خب"
  end
    return "ایولاااا خیلی عوضی بود به هرحال بلاک شد خوشحال باش"
  end
end
 
return {
  patterns = {
    "^[!/$&-=+:*.%#?@]block (user) (%d+)$",
    "^block (user) (%d+)$",
  },
  run = run,
}
