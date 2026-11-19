-- Threat: !InfrastructureShared
-- Name: a5bea940f64d
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:SMSReg.F")
  return mp.INFECTED
end
return mp.LOWFI
