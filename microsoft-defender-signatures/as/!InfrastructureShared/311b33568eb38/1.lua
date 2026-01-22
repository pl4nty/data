-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\311b33568eb38\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0)
  -- function num : 0_0
  if type(l_1_0) ~= "string" then
    return nil
  end
  local l_1_1 = l_1_0:match("\"([^\"]-%.[dD][lL][lL])\"")
  if l_1_1 then
    return l_1_1
  end
  local l_1_2 = l_1_0:match("([a-zA-Z]:[\\/][^<>:\"|%?%*]-%.[dD][lL][lL])")
  if l_1_2 then
    return l_1_2
  end
  local l_1_3 = l_1_0:match("(\\\\[^<>:\"|%?%*]-%.[dD][lL][lL])")
  if l_1_3 then
    return l_1_3
  end
  return l_1_0:match("([%w%._%-%\\/%(%)~]+%.[dD][lL][lL])")
end

local l_0_1 = nil
if (this_sigattrlog[2]).matched then
  l_0_1 = (string.lower)((this_sigattrlog[2]).utf8p2)
else
  return mp.CLEAN
end
local l_0_2 = l_0_0(l_0_1)
if l_0_2 ~= nil then
  local l_0_3 = (mp.ContextualExpandEnvironmentVariables)(l_0_2)
  if not (mp.IsKnownFriendlyFile)(l_0_3, true, false) then
    local l_0_4 = (bm.get_current_process_startup_info)()
    do
      do
        if l_0_4 and next(l_0_4) and l_0_4.command_line then
          local l_0_5 = (string.lower)(l_0_4.command_line)
          bm_AddRelatedFileFromCommandLine(l_0_5, nil, nil, 1)
          ;
          (bm.request_SMS)(l_0_4.ppid, "h+")
          ;
          (bm.add_action)("SmsAsyncScanEvent", 1)
          ;
          (bm.add_related_string)("[->] MEDICATED CMD: ", l_0_5, bm.RelatedStringBMReport)
          ;
          (bm.add_related_file)(l_0_5)
        end
        triggerMemoryScanOnProcessTree(true, false, "SMS_H", 5000, "Behavior:Win32/SusDllExec.MK!sms")
        add_parents()
        do return mp.INFECTED end
        return mp.CLEAN
      end
    end
  end
end

