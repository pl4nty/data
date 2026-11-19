-- Threat: !InfrastructureShared
-- Name: 4c8d1ada5ecb
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:Macnist.B")
  return mp.INFECTED
end
return mp.LOWFI
