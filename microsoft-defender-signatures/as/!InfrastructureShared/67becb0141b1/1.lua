-- Threat: !InfrastructureShared
-- Name: 67becb0141b1
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:SMSReg.H!MTB")
  return mp.INFECTED
end
return mp.LOWFI
