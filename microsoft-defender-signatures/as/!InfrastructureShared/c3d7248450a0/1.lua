-- Threat: !InfrastructureShared
-- Name: c3d7248450a0
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 or #l_0_1 <= 10 then
  return mp.CLEAN
end
local l_0_2 = "\\\\\\\\.*\\\\(?:netlogon|share$)\\\\\\w{3,}.(?:exe|dll)(?:[,\\w]+)?\\s+-u\\s+\\w+\\:\\w+"
local l_0_3 = false
l_0_3, _ = MpCommon.StringRegExpSearch(l_0_2, l_0_1)
if l_0_3 then
  return mp.LOWFI
end
return mp.CLEAN
