-- Threat: !InfrastructureShared
-- Name: !#JScleanup
-- Type: 13
-- MpAttributes: Lua:JSExt & SCRT:JS/CodeInMalicious.S1

local l_0_0 = mp.getfilesize()
if l_0_0 < 4096 or 16777216 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil then
  return mp.CLEAN
end
if string.find(l_0_1, "notice_", 1, true) ~= nil then
  mp.set_mpattribute("Lua:JS.MalwareCampaign.S1")
end
return mp.CLEAN
