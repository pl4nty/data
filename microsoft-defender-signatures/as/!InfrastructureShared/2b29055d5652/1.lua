-- Threat: !InfrastructureShared
-- Name: 2b29055d5652
-- Type: 21
-- Includes: LuaFuncHelper, ResearchData

if not mp.get_mpattribute("MpIsPowerShellAMSIScan") then
  return mp.CLEAN
end
if IsCloudTestMachine() then
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
local l_0_2 = "((add|set)-mppreference\\s+-exclusionprocess\\s+(\\*?\\.?exe|c:\\\\*\\*?%?)([\\s;]|$))"
local l_0_3, l_0_4 = MpCommon.StringRegExpSearch(l_0_2, l_0_1)
if l_0_3 then
  set_research_data("BadExclusions", MpCommon.Base64Encode(l_0_4), false)
  return mp.INFECTED
end
l_0_2 = "((add|set)-mppreference\\s+-exclusionprocess\\s+[\"'](\\*?\\.?exe|c:\\\\*\\*?%?)[\"']([\\s;]|$))"
l_0_3, l_0_4 = MpCommon.StringRegExpSearch(l_0_2, l_0_1)
if l_0_3 then
  set_research_data("BadExclusions", MpCommon.Base64Encode(l_0_4), false)
  return mp.INFECTED
end
return mp.CLEAN
