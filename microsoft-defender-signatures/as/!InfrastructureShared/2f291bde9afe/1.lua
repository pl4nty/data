-- Threat: !InfrastructureShared
-- Name: 2f291bde9afe
-- Type: 21
-- Includes: LuaFuncHelper, ResearchData

if not mp.get_mpattribute("MpIsPowerShellAMSIScan") then
  return mp.CLEAN
end
local l_0_0 = mp.GetBruteMatchData()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = ""
if l_0_0.is_header then
  l_0_1 = string.lower(tostring(headerpage))
else
  l_0_1 = string.lower(tostring(footerpage))
end
if not l_0_1 then
  return mp.CLEAN
end
if IsCloudTestMachine() then
  return mp.CLEAN
end
local l_0_2 = "(path\\s+c:\\\\*\\*?%?([\\s;]|$))"
local l_0_3, l_0_4 = MpCommon.StringRegExpSearch(l_0_2, l_0_1)
if l_0_3 and l_0_4 then
  set_research_data("BadExclusion", MpCommon.Base64Encode(l_0_4), false)
  return mp.INFECTED
end
l_0_2 = "(path\\s+[\"']c:\\\\*\\*?%?[\"']([\\s;]|$))"
l_0_3, l_0_4 = MpCommon.StringRegExpSearch(l_0_2, l_0_1)
if l_0_3 and l_0_4 then
  set_research_data("BadExclusion", MpCommon.Base64Encode(l_0_4), false)
  addDisruptionInfo(true)
  return mp.INFECTED
end
return mp.CLEAN
