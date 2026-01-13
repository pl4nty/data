-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1acb34378becb\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (versioning.GetOrgID)()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = {}
l_0_1["64eacc49-6a31-42c6-9b39-c3d9148e65f4"] = true
l_0_1["0d5a49d5-57c7-40c0-ab8b-3a066e83b05a"] = true
l_0_1["4ec5f50d-2073-4ecf-986c-0dcca43f933a"] = true
if not l_0_1[(string.lower)(l_0_0)] then
  return mp.CLEAN
end
local l_0_2 = function(l_1_0)
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

local l_0_3 = nil
if (this_sigattrlog[1]).matched then
  l_0_3 = (string.lower)((this_sigattrlog[1]).utf8p2)
else
  return mp.CLEAN
end
local l_0_4 = l_0_2(l_0_3)
if l_0_4 ~= nil then
  local l_0_5 = (mp.ContextualExpandEnvironmentVariables)(l_0_4)
  if not (mp.IsKnownFriendlyFile)(l_0_5, true, false) then
    local l_0_6 = (bm.get_current_process_startup_info)()
    do
      do
        if l_0_6 and next(l_0_6) and l_0_6.command_line then
          local l_0_7 = (string.lower)(l_0_6.command_line)
          bm_AddRelatedFileFromCommandLine(l_0_7, nil, nil, 1)
          ;
          (bm.request_SMS)(l_0_6.ppid, "h+")
          ;
          (bm.add_action)("SmsAsyncScanEvent", 1)
          ;
          (bm.add_related_string)("[->] MEDICATED CMD: ", l_0_7, bm.RelatedStringBMReport)
          ;
          (bm.add_related_file)(l_0_7)
        end
        triggerMemoryScanOnProcessTree(true, false, "SMS_H", 5000, "Behavior:Win32/SuspDllExec.AL!sms")
        add_parents()
        do return mp.INFECTED end
        return mp.CLEAN
      end
    end
  end
end

