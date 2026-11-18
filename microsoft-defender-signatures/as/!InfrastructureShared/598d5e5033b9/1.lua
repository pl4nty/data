-- Threat: !InfrastructureShared
-- Name: 598d5e5033b9
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:Genieo.O")
  return mp.INFECTED
end
return mp.LOWFI
