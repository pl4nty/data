-- Threat: !InfrastructureShared
-- Name: 5a898e27788c
-- Type: 21

if mp.get_mpattribute("CURE:Virus:Win32/Expiro.EK1") then
  return mp.INFECTED
end
return mp.CLEAN
