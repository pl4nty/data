-- Threat: !InfrastructureShared
-- Name: cd8dbf74b02a
-- Type: 21

if mp.HSTR_WEIGHT >= 2 then
  mp.set_mpattribute("PUA:Block:SpyMe.D")
  return mp.INFECTED
end
return mp.LOWFI
