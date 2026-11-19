-- Threat: !InfrastructureShared
-- Name: e78d96085682
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:Genieo.A2")
  return mp.INFECTED
end
return mp.LOWFI
