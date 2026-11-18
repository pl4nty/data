-- Threat: !InfrastructureShared
-- Name: 6f8d60d7bd0a
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Social2Search.B")
  return mp.INFECTED
end
return mp.LOWFI
