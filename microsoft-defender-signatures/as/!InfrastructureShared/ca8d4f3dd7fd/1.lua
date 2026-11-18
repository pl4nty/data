-- Threat: !InfrastructureShared
-- Name: ca8d4f3dd7fd
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:SpyMe.A")
  return mp.INFECTED
end
return mp.LOWFI
