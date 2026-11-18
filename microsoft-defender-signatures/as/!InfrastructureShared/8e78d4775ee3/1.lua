-- Threat: !InfrastructureShared
-- Name: 8e78d4775ee3
-- Type: 21

if mp.get_mpattribute("NID:Trickbot.PI!MSR") then
  return mp.INFECTED
end
return mp.CLEAN
