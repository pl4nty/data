-- Threat: !InfrastructureShared
-- Name: 62be10a71357
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:SmsReg.A")
  return mp.INFECTED
end
return mp.LOWFI
