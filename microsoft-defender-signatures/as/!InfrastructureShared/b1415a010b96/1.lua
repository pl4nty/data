-- Threat: !InfrastructureShared
-- Name: b1415a010b96
-- Type: 21

if mp.get_mpattribute("SCRIPT:scripthasexe") then
  return mp.INFECTED
end
return mp.CLEAN
