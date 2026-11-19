-- Threat: !InfrastructureShared
-- Name: a5be2267c7b8
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:SMSReg.I")
  return mp.INFECTED
end
return mp.LOWFI
