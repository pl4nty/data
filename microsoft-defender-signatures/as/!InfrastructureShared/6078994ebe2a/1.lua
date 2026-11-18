-- Threat: !InfrastructureShared
-- Name: 6078994ebe2a
-- Type: 21

if mp.get_mpattribute("HSTR:IsVB6") then
  return mp.INFECTED
end
return mp.CLEAN
