-- Threat: !InfrastructureShared
-- Name: 2c6d7eb0f21aa
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.GetProcessCommandLine(l_0_0))
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = {"python", "trufflehog"}
for l_0_3, l_0_4 in ipairs(l_0_2) do
  if string.find(l_0_1, l_0_4, 1, true) then
    return mp.CLEAN
  end
end
return mp.INFECTED
