-- Threat: !InfrastructureShared
-- Name: 6dd761c9f3bb
-- Type: 21
-- Includes: BMLuaLib

if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil or l_0_0.image_path == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.image_path)
if not l_0_1:find("\\explorer.exe") then
  return mp.CLEAN
end
local l_0_2 = mp.GetScannedPPID()
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = mp.GetProcessCommandLine(l_0_2):lower()
local l_0_4 = NormalizeCmdline("powershell", l_0_3)
if not l_0_4 then
  return mp.CLEAN
end
if not isIEXfound(l_0_4) then
  return mp.CLEAN
end
local l_0_5 = "downloadstring[\\'\\\"\\(\\s]+https?:\\/\\/\\d+.\\d+.\\d+.\\d+\\/\\w+[\\'\\\"\\)\\s]+"
local l_0_6, l_0_7 = MpCommon.StringRegExpSearch(l_0_5, l_0_4)
if l_0_6 then
  return mp.INFECTED
end
return mp.CLEAN
