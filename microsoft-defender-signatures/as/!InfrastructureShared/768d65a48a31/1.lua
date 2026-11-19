-- Threat: !InfrastructureShared
-- Name: 768d65a48a31
-- Type: 21

if mp.HSTR_WEIGHT >= 2 then
  mp.set_mpattribute("PUA:Block:SpyMe.B")
  return mp.INFECTED
end
return mp.LOWFI
