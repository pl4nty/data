-- Threat: !InfrastructureShared
-- Name: 9dbe5e6c9d04
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:SMSReg.L")
  return mp.INFECTED
end
return mp.LOWFI
