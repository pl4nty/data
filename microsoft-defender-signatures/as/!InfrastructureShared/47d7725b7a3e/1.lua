-- Threat: !InfrastructureShared
-- Name: 47d7725b7a3e
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.GetProcessCommandLine(l_0_0))
local l_0_2 = string.match(l_0_1, "https?://(%d+)/")
if l_0_2 ~= nil then
  local l_0_3
  if string.find(l_0_2, "^[01]+$") ~= nil and 24 < #l_0_2 then
    l_0_3 = mp.shr32(tonumber(l_0_2, 2), 24)
  else
    l_0_3 = mp.shr32(tonumber(l_0_2), 24)
  end
  if l_0_3 == nil or l_0_3 == 127 or l_0_3 == 10 then
    return mp.CLEAN
  else
    return mp.INFECTED
  end
end
return mp.CLEAN
