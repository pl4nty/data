-- Threat: !InfrastructureShared
-- Name: 6fd7bcb74af2
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 or #l_0_1 <= 10 then
  return mp.CLEAN
end
local l_0_2 = mp.GetParentProcInfo()
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = string.lower(l_0_2.image_path)
if l_0_3 == nil then
  return mp.CLEAN
end
if not l_0_3:find("\\svchost.exe") then
  return mp.CLEAN
end
local l_0_4 = "\\\\\\\\.*\\\\netlogon\\\\\\w{3,}.(?:exe|dll)(?:[,\\w]+)?\\s+-u\\s+\\w+\\:\\w+"
local l_0_5 = false
l_0_5, _ = MpCommon.StringRegExpSearch(l_0_4, l_0_1)
if l_0_5 then
  return mp.INFECTED
end
return mp.CLEAN
