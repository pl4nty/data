-- Threat: !InfrastructureShared
-- Name: 838da16834c0
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:Glims.J")
  return mp.INFECTED
end
return mp.LOWFI
