-- Threat: !InfrastructureShared
-- Name: 69be345e5eaa
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:SMSReg.E")
  return mp.INFECTED
end
return mp.LOWFI
