-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2f291bde9afe\1.luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattribute)("MpIsPowerShellAMSIScan") then
  return mp.CLEAN
end
local l_0_0 = (mp.GetBruteMatchData)()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = ""
if l_0_0.is_header then
  l_0_1 = (string.lower)(tostring(headerpage))
else
  l_0_1 = (string.lower)(tostring(footerpage))
end
if not l_0_1 then
  return mp.CLEAN
end
if IsCloudTestMachine() then
  return mp.CLEAN
end
local l_0_2 = "(path\\s+c:\\\\*\\*?%?([\\s;]|$))"
local l_0_3, l_0_4 = (MpCommon.StringRegExpSearch)(l_0_2, l_0_1)
if l_0_3 and l_0_4 then
  set_research_data("BadExclusion", (MpCommon.Base64Encode)(l_0_4), false)
  return mp.INFECTED
end
l_0_2 = "(path\\s+[\"\']c:\\\\*\\*?%?[\"\']([\\s;]|$))"
l_0_3 = (MpCommon.StringRegExpSearch)(l_0_2, l_0_1)
if l_0_3 and l_0_4 then
  set_research_data("BadExclusion", (MpCommon.Base64Encode)(l_0_4), false)
  addDisruptionInfo(true)
  return mp.INFECTED
end
return mp.CLEAN

