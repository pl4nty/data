-- Threat: !InfrastructureShared
-- Name: 528d25f290f2
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Ulbi.B")
  return mp.INFECTED
end
return mp.LOWFI
