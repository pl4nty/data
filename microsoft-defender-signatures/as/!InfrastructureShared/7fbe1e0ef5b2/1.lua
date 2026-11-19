-- Threat: !InfrastructureShared
-- Name: 7fbe1e0ef5b2
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:SMSreg.C")
  return mp.INFECTED
end
return mp.LOWFI
