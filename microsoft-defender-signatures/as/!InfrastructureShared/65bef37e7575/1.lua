-- Threat: !InfrastructureShared
-- Name: 65bef37e7575
-- Type: 21

if mp.HSTR_WEIGHT >= 2 then
  mp.set_mpattribute("PUA:Block:SProvider.B")
  return mp.INFECTED
end
return mp.LOWFI
