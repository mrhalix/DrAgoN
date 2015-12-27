-- data saved to data/moderation.json
do

          local user = 'user#id'..msg.action.user.id
        -- if sticker is sent
        elseif msg.media and msg.media.caption == 'sticker.webp' and not is_sudo(msg.from.id) then
          local user_id = msg.from.id
          local chat_id = msg.to.id
          local sticker_hash = 'mer_sticker:'..chat_id..':'..user_id
          local is_sticker_offender = redis:get(sticker_hash)
          if settings.sticker == 'warn' then
            if is_sticker_offender then
              chat_del_user(get_receiver(msg), 'user#id'..user_id, ok_cb, true)
              redis:del(sticker_hash)
              return 'You have been warned to not sending sticker into this group!'
            elseif not is_sticker_offender then
              redis:set(sticker_hash, true)
              return 'DO NOT send sticker into this group!\nThis is a WARNING, next time you will be kicked!'
            end
          elseif settings.sticker == 'kick' then
            chat_del_user(get_receiver(msg), 'user#id'..user_id, ok_cb, true)
            return 'DO NOT send sticker into this group!'
          elseif settings.sticker == 'ok' then
            return nil
          end
      

  return {
    description = 'Plugin to manage group chat.',
    usage = {
      admin = {
        '!mkgroup <group_name> : Make/create a new group.',
        '!addgroup : Add group to moderation list.',
        '!remgroup : Remove group from moderation list.'
      },
      moderator = {
        '!group <lock|unlock> bot : {Dis}allow APIs bots.',
        '!group <lock|unlock> member : Lock/unlock group member.',
        '!group <lock|unlock> name : Lock/unlock group name.',
        '!group <lock|unlock> photo : Lock/unlock group photo.',
        '!group settings : Show group settings.',
        '!link <set> : Generate/revoke invite link.',
        '!setabout <description> : Set group description.',
        '!setname <new_name> : Set group name.',
        '!setphoto : Set group photo.',
        '!setrules <rules> : Set group rules.',
        '!sticker warn : Sticker restriction, sender will be warned for the first violation.',
        '!sticker kick : Sticker restriction, sender will be kick.',
        '!sticker ok : Disable sticker restriction.'
      },
      user = {
        '!about : Read group description',
        '!rules : Read group rules',
        '!link <get> : Print invite link'
      },
    },
    patterns = {
      '%[(audio)%]',
      '%[(document)%]',
      '^!(sticker) (.*)$',
      '^!!tgservice (.+)$',
      '%[(video)%]'
    },
    run = run,
    pre_process = pre_process
  }

end
