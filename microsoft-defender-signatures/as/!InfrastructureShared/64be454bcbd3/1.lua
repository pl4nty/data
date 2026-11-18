-- Threat: !InfrastructureShared
-- Name: 64be454bcbd3
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Feiad.B")
  return mp.INFECTED
end
return mp.LOWFI
