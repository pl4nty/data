-- Threat: !InfrastructureShared
-- Name: 96beb0023cbc
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:SmsReg.B")
  return mp.INFECTED
end
return mp.LOWFI
