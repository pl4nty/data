-- Threat: !InfrastructureShared
-- Name: b9beadb6979e
-- Type: 21

if mp.HSTR_WEIGHT >= 7 then
  mp.set_mpattribute("PUA:Block:SMSreg.TA")
  return mp.INFECTED
end
return mp.LOWFI
