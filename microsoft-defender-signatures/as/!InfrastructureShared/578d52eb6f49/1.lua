-- Threat: !InfrastructureShared
-- Name: 578d52eb6f49
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:KidLoggre.B")
  return mp.INFECTED
end
return mp.LOWFI
