-- Threat: !InfrastructureShared
-- Name: e58d5efdfea4
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Adload.M")
  return mp.INFECTED
end
return mp.LOWFI
