-- Threat: !InfrastructureShared
-- Name: eb8daef31593
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Adload.J")
  return mp.INFECTED
end
return mp.LOWFI
