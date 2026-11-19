-- Threat: !InfrastructureShared
-- Name: 5e8c79cd8bc6
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:MobiDash.H")
  return mp.INFECTED
end
return mp.LOWFI
