-- Threat: !InfrastructureShared
-- Name: 6fbeffdbf075
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:AnyDown.A")
  return mp.INFECTED
end
return mp.LOWFI
