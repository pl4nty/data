-- Threat: !InfrastructureShared
-- Name: 37d75d8b5bd0
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.GetProcessCommandLine(l_0_0))
if l_0_1 then
  local l_0_2 = string.match(l_0_1, "/curl/([A-Fa-f0-9]+)$")
  if l_0_2 and #l_0_2 == 64 then
    return mp.INFECTED
  end
end
return mp.CLEAN
