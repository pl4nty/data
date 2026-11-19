-- Threat: !InfrastructureShared
-- Name: 2a787098ffb4
-- Type: 21

if mp.get_mpattribute("MpHasExpensiveLoop") then
  return mp.INFECTED
end
return mp.CLEAN
