-- Threat: !InfrastructureShared
-- Name: 6bbeb8ad1ef9
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:Viser.B")
  return mp.INFECTED
end
return mp.LOWFI
