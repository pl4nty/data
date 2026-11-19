-- Threat: !InfrastructureShared
-- Name: 528d445c0e12
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:MacRepair.A")
  return mp.INFECTED
end
return mp.LOWFI
