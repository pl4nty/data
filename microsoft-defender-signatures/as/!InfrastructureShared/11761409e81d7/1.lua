-- Threat: !InfrastructureShared
-- Name: 11761409e81d7
-- Type: 21

if mp.get_mpattribute("HSTR:IsVB6") then
  return mp.INFECTED
end
return mp.CLEAN
