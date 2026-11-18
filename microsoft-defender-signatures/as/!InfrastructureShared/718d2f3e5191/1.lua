-- Threat: !InfrastructureShared
-- Name: 718d2f3e5191
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:DirectHW")
  return mp.INFECTED
end
return mp.LOWFI
