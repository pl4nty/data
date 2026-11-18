-- Threat: !InfrastructureShared
-- Name: dd8d6b0c2d0f
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:Genieo.M")
  return mp.INFECTED
end
return mp.LOWFI
