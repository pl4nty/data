-- Threat: !InfrastructureShared
-- Name: 7cbe3fea617e
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:SMSReg.J")
  return mp.INFECTED
end
return mp.LOWFI
