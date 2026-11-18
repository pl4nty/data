-- Threat: !InfrastructureShared
-- Name: 948d79acc34e
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Genieo.K")
  return mp.INFECTED
end
return mp.LOWFI
