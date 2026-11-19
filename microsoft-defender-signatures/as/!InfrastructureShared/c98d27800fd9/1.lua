-- Threat: !InfrastructureShared
-- Name: c98d27800fd9
-- Type: 21

if mp.HSTR_WEIGHT >= 2 then
  mp.set_mpattribute("PUA:Block:MacOptimizer.B")
  return mp.INFECTED
end
return mp.LOWFI
