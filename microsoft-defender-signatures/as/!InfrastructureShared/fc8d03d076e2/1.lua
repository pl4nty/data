-- Threat: !InfrastructureShared
-- Name: fc8d03d076e2
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:Conduit.F")
  return mp.INFECTED
end
return mp.LOWFI
