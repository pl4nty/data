-- Threat: !InfrastructureShared
-- Name: bfb38969b6ca
-- Type: 21

local l_0_0 = this_sigattrlog[1].utf8p2
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1, l_0_2 = string.match(l_0_0, " pid:(%d+) (.+)")
if l_0_1 == nil or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = mp.GetPPidFromPid(l_0_1)
if l_0_3 == nil then
  return mp.CLEAN
end
if string.find(l_0_2, "^ems$") then
  bm.trigger_sig("AsyncTriggerEMS", "EMS", l_0_3)
elseif string.find(l_0_2, "^sms:") then
  local l_0_4 = string.match(l_0_2, "sms:(.+)")
  bm.trigger_sig("AsyncTriggerSMS", l_0_4, l_0_3)
elseif string.find(l_0_2, "^exhaustive$") then
  bm.trigger_sig("AsyncTriggerProc", "Exhaustive", l_0_3)
end
return mp.INFECTED
